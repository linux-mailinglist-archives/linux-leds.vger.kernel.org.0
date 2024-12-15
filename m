Return-Path: <linux-leds+bounces-3608-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D60889F2630
	for <lists+linux-leds@lfdr.de>; Sun, 15 Dec 2024 22:13:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D2D51885551
	for <lists+linux-leds@lfdr.de>; Sun, 15 Dec 2024 21:13:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DC92189F20;
	Sun, 15 Dec 2024 21:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ubukre0F"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2752A189905
	for <linux-leds@vger.kernel.org>; Sun, 15 Dec 2024 21:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734297208; cv=none; b=b9JiZALhA7ROIUQK0igYOXtpnlemETIzL6R9kzRkYGuOAxnifoCB0SvFaRsyi8ePy/PjGTW88sqje65BO3tFjBGaPTcNdXyfjLWlm4KxHhl+2zYQENRLacTHJpH9X9os6ZZBSVhhI+iXGR+HUatDTFr9OW7xKta3rdqPRjpgBeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734297208; c=relaxed/simple;
	bh=TeMJWNZ1Wxuxpg12TIPCikRu24tSt3q3drgp8mtIeBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kkiA3D3SRt+dM4lPG8q8ZRRi/O7kaAyh6PyV9UtGP9t4jKfVHoaFZqq54ox9IxmOnQRY1swKG4cyRr0QCMlhVAXo+tCj9fRBfm5V7d4idmH0ClEGV5pEWX2VQmFf5u6sksoYDMxQbuEyPck5VypvdntPYdvSYUvWNvgI6JVHGvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ubukre0F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D47C5C4CECE;
	Sun, 15 Dec 2024 21:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734297207;
	bh=TeMJWNZ1Wxuxpg12TIPCikRu24tSt3q3drgp8mtIeBQ=;
	h=From:To:Cc:Subject:Date:From;
	b=ubukre0FwpEApLNMsizvCaTVwhjSuDfXGKns1AQlaIAMkD/13TmUKCI0HVLh6Wx1p
	 gREDbdh5Kcp6QTdQq6GixZcx3GbPwVzj5moVpSpx3Zf3nnU9hESZywMNMsf6t2ppRu
	 HFx/fzMiwduDOaKhxaFWcdCWX6YdAnn49aY1sifM8x0/3Am+ZHsqW6fnWYNJ9yNDCS
	 70QYMOU663Rfc3+z+aleQAF4zvUxqG657ZYJRQIVCdZflTKZvH7vWPa9ahoOX9v1kL
	 jq4GCm2og1CzzUyuQ9qgQFULcH2hhw0H7PKTpdsdBNUEsyyXfUJf64sbrHrdAC3rG1
	 Im128t10z0PEw==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH leds] turris-omnia-mcu-interface.h: Move macro definitions outside of enums
Date: Sun, 15 Dec 2024 22:13:23 +0100
Message-ID: <20241215211323.23364-1-kabel@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Move the definitions of enumerator related macros outside of the
enumerator definitions.

Link: https://lore.kernel.org/linux-leds/20241212183357.GK7139@google.com/
Signed-off-by: Marek Behún <kabel@kernel.org>
---
 include/linux/turris-omnia-mcu-interface.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/linux/turris-omnia-mcu-interface.h b/include/linux/turris-omnia-mcu-interface.h
index 06c94e032c6f..38b45ab00053 100644
--- a/include/linux/turris-omnia-mcu-interface.h
+++ b/include/linux/turris-omnia-mcu-interface.h
@@ -241,16 +241,18 @@ enum omnia_int_e {
 
 enum omnia_cmd_led_mode_e {
 	OMNIA_CMD_LED_MODE_LED_MASK	= GENMASK(3, 0),
-#define OMNIA_CMD_LED_MODE_LED(_l)	FIELD_PREP(OMNIA_CMD_LED_MODE_LED_MASK, _l)
 	OMNIA_CMD_LED_MODE_USER		= BIT(4),
 };
 
+#define OMNIA_CMD_LED_MODE_LED(_l)	FIELD_PREP(OMNIA_CMD_LED_MODE_LED_MASK, _l)
+
 enum omnia_cmd_led_state_e {
 	OMNIA_CMD_LED_STATE_LED_MASK	= GENMASK(3, 0),
-#define OMNIA_CMD_LED_STATE_LED(_l)	FIELD_PREP(OMNIA_CMD_LED_STATE_LED_MASK, _l)
 	OMNIA_CMD_LED_STATE_ON		= BIT(4),
 };
 
+#define OMNIA_CMD_LED_STATE_LED(_l)	FIELD_PREP(OMNIA_CMD_LED_STATE_LED_MASK, _l)
+
 enum omnia_cmd_poweroff_e {
 	OMNIA_CMD_POWER_OFF_POWERON_BUTTON	= BIT(0),
 	OMNIA_CMD_POWER_OFF_MAGIC		= 0xdead,
-- 
2.45.2


