local ingredient_dialog = {}
toggle_ingredients_chat = true
ingredient_dialog["pln_rt1_12"] = "Zutat hinzugefügt - Added ingredient" --Comment out the parts of the script you dont want in chat by adding two dashes at the start of the line
ingredient_dialog["pln_rt1_20"] = "Füge Salzsäure zu - Add muriatic acid" --Commenting these parts out will stop them from being shown in game
ingredient_dialog["pln_rt1_22"] = "Füge Ätznatron zu - Add caustic soda"
ingredient_dialog["pln_rt1_24"] = "Füge Chlorwasserstoff zu - Add hydrogen chloride"
ingredient_dialog["pln_rt1_28"] = "Meth ist fertig - Meth is done"
ingredient_dialog["pln_rat_stage1_20"] = "Füge Salzsäure zu - Add muriatic acid"
ingredient_dialog["pln_rat_stage1_22"] = "Füge Ätznatron zu - Add caustic soda"
ingredient_dialog["pln_rat_stage1_24"] = "Füge Chlorwasserstoff zu - Add hydrogen chloride"
ingredient_dialog["pln_rat_stage1_28"] = "Meth ist fertig - Meth is done"



local _queue_dialog_orig = DialogManager.queue_dialog
function DialogManager:queue_dialog(id, ...)
    if ingredient_dialog[id] and toggle_ingredients_chat then
	managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", ingredient_dialog[id])
    elseif ingredient_dialog[id] and not toggle_ingredients_chat then
	managers.hud:show_hint({text = ingredient_dialog[id]})
    end
    return _queue_dialog_orig(self, id, ...)
end


