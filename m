Return-Path: <linux-leds+bounces-8057-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0OqtClIB/mkRmAAAu9opvQ
	(envelope-from <linux-leds+bounces-8057-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 08 May 2026 17:29:22 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A5D4F8B20
	for <lists+linux-leds@lfdr.de>; Fri, 08 May 2026 17:29:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 779A9309B9F0
	for <lists+linux-leds@lfdr.de>; Fri,  8 May 2026 15:26:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 084DA3F65EF;
	Fri,  8 May 2026 15:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lcRvfX1A"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB953F0743
	for <linux-leds@vger.kernel.org>; Fri,  8 May 2026 15:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778254011; cv=none; b=K/YEwALHMaJiQPLwB+e8q3PeOu6rfXk5JiT7W4zOHS2mgtocLbtWvBb4MXXFD51wXIv8oc+FBg+c6sQRf34XS8/bMSXTceuwNnDtcIKDJhOs8iDJn44qjqKSDrnOtCSkeVBxxCxGBWL7xVXmgRXqxpD4J9KJcAYa8Gtnz+Uf0LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778254011; c=relaxed/simple;
	bh=nyMTRWzeAj/fdIbJOO7agc/LqBuV7MsuCjx+Azz5FJg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sGN4bM5W2Bguv8S0D0284h0Nd9J4KPThYvOhqWgujm7w64/QKM4lVjRIlLvr898AHZoilyxkMVjL0rqqBITECCQHMCahitzZ9zM8cvML29xLayGpNtOjpZ5YOgC6pKWIzGbYggvohoRDwJx7Lj7IKmMtVsE7xiVGppXTZFVPhBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lcRvfX1A; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12dca45ca21so3232817c88.1
        for <linux-leds@vger.kernel.org>; Fri, 08 May 2026 08:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778254010; x=1778858810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pB2cQFjbuhjdNnTnLKqzrMd9wBQ0wQUJd1YqmbY53n8=;
        b=lcRvfX1A5X1S0tZJ4wvUuxYgmH1LM88BrmZXI3d5ldb8Ot7oYSi4GkV7xxR31bybER
         X8j9m8gGrafcQf7h97xZtcPE8Xal4hYHt4jWN1b73Q+aGUIPI/6HC21LxrFazKKfp3R1
         PEwnS4qzC6Rabi5ud90zJ+1goU4pFoKg1tEL2Ua42x9RWOjAbTg7/J7OaCOY/DKoOmBG
         oXgc3+/xMSfwGQ38NlWZfCudoNxlytnl3A48kvNau6BkDijJrOMNT7bSzmqDx3S7GR4X
         RCn2cVZKXSOK0mIrPURyxWnKEWRdlg67v7xph/Cpd5XiBmz+0G7bNrQ49RhTpextZfTS
         QD0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778254010; x=1778858810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pB2cQFjbuhjdNnTnLKqzrMd9wBQ0wQUJd1YqmbY53n8=;
        b=D3DsBouq/W4qC+dYmyTE+sPtno0VbCvExCyklgQOowbcTRTJ9Ii5BrumJIGakpZINu
         rFnhCUsitB8cDuxqMteq2qCWS4iB8lhtjpBCT5nb/rZ+L5dUPuhtSV0l1tVzmmmCT8cs
         y76DXjG535Kp72xQiIpkd3Vna3/pt99PyKbolewTfj8npN/cSzFgZO/kiVtELxfGndAY
         D+Az9FCBDMyg0NBgX5ttA9EpWY/h6KP2MmvqbEKE4pN56HTV+cu08UNglqGHZHW5g9fB
         FAbeDD2Zh/sWMFABz5yO7riDq/CoaDjilfSC/kMLoh9eyNI3vymtUXnd+YSDjHKD+HdG
         NtWw==
X-Forwarded-Encrypted: i=1; AFNElJ97epCdJDf8SL4rQU1aJZqqQ7kY/NXuy+rYW9LUORkmnBRp55kJHEFt7vVs9Nxk2b7/j96HgglQhhpQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yxukk0Z6vp1SQNp0un0RbqeNuXYrCMMkQU1VVUD7/rrtuUyN4Zu
	jrZLesET2sCuYEkcPPPJhu0umIRqYnsLf9lnI/wdlc8VIIQISF6ohfSq8gzKmU2K
X-Gm-Gg: Acq92OGI8l5JvB8JShrASUq7aog3qoNZEmbgKPuDMhEI8pJesY0hlliGSkN25nK/vtj
	IxFae7djw6qbdbjC6s4Kgp1rvcF6s7nGQUl2OlNrchHMxKL1Zrur+5Rm1Ivr3QrYITkthNviSEN
	RZ+EA6pjtajYIQNrK7W91rat2BpsoEFTT9b9FaK98197WN3J7kLrEogd88jEKrdcTxrvne95z7M
	wX1cYLx9LkURsEGq84R8tE2IuJhmMfZzraHG80Fl5xTfnDThZGCcna3TExMwDOrviyYY/dkESR6
	lO++c1F2J4LvQjnlj1dzf7JIl/sJS7erWgoXoA7QJr9ed7JYXo7b37VpqBjinoo9FNTdpikq0H/
	+dvITkHz+LW/Q6f7/CIN9IqVX0aU0vjMgELVdzIVQW6W8bAyTL1kJeTf/SN1D0fPkeoL8uaKIkg
	NRRm+jzgU0SbHJplclquBV9xV1nteqmAYl1Z6V
X-Received: by 2002:a05:693c:2c02:b0:2d1:d434:d022 with SMTP id 5a478bee46e88-2f544ce9df2mr5983287eec.0.1778254009639;
        Fri, 08 May 2026 08:26:49 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a53:11:5d6e:9aed:ce1b:4ae9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d43b4sm2535486eec.11.2026.05.08.08.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 08:26:49 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Grant Feng <von81@163.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Romain Perier <romain.perier@gmail.com>,
	Paul Barker <paul.barker@sancloud.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Robert Marko <robert.marko@sartura.hr>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Peter Rosin <peda@axentia.se>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/5] arm64: dts: qcom: msm8916-alcatel-idol347: Fix sn3190 shutdown GPIO polarity
Date: Fri,  8 May 2026 23:24:20 +0800
Message-ID: <20260508152435.21389-4-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260508152435.21389-1-jerrysteve1101@gmail.com>
References: <20260508152435.21389-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 82A5D4F8B20
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,ucw.cz,kernel.org,axis.com,axentia.se,vger.kernel.org,lists.infradead.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-8057-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,lunn.ch,bootlin.com,gmail.com,mailoo.org,163.com,arm.com,sntech.de,sancloud.com,foss.st.com,sartura.hr];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jerrysteve1101@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lumissil.com:url,0.0.0.68:email]
X-Rspamd-Action: no action

The sn3190 shutdown pin is active-low [1]. Correct the GPIO flags
from GPIO_ACTIVE_HIGH to GPIO_ACTIVE_LOW to match the hardware.

[1] https://lumissil.com/assets/pdf/core/IS31FL3190_DS.pdf

Fixes: 1c8cc183d070 ("arm64: dts: qcom: msm8916-alcatel-idol347: add LED indicator")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts b/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
index 2de8b6f9531b..6d51d6efcbac 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
@@ -197,7 +197,7 @@ &blsp_i2c6 {
 	led-controller@68 {
 		compatible = "si-en,sn3190";
 		reg = <0x68>;
-		shutdown-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
+		shutdown-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&led_enable_default &led_shutdown_default>;
 		#address-cells = <1>;
-- 
2.54.0


