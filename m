Return-Path: <linux-leds+bounces-8059-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBp2LqkB/mkTlwAAu9opvQ
	(envelope-from <linux-leds+bounces-8059-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 08 May 2026 17:30:49 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2427A4F8B66
	for <lists+linux-leds@lfdr.de>; Fri, 08 May 2026 17:30:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 831FE30C0064
	for <lists+linux-leds@lfdr.de>; Fri,  8 May 2026 15:27:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2C4A3FB7E2;
	Fri,  8 May 2026 15:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tDkIVrsn"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E13F3EBF16
	for <linux-leds@vger.kernel.org>; Fri,  8 May 2026 15:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778254044; cv=none; b=aLaWXeFDtmQ6BW6LsA4CeQHMttJ4dSar2oG3GATKtPAkHjOwdZ3uUZs3O6JAO0G65H34n75RgERYm+nv4iBsEyKKSpscbYCaZoB8t628Imcm+JuTJcsUB4uVslsIZG6Jto3zxWmbz8rEs72Ednowd7yflxYz7R2DQCRkRlt6gPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778254044; c=relaxed/simple;
	bh=ow2Pp8Yde2ialN0PVZ+ngSDDkSxMoIzeQ2w8Qc4ooeg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U1b6/pgk/YopdhSfb6pgUqbGfLDwVNg9/pDyLEODTzqTmInhTcIcnmHak+9TPWB6B9wFK/W1b/IlZPJYhwEtB7qadFJTalhhZWzeTn1tjwQQsATzEgSd+fK5CD2ckaOscSQpWOjBXtjL2C3CrVyCzqQZqZX7UFittH2mDDjcSzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tDkIVrsn; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2ef2a1cc06dso437158eec.0
        for <linux-leds@vger.kernel.org>; Fri, 08 May 2026 08:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778254041; x=1778858841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IY5VpH1QCqNL+Hxqm+EMdHN3zeBtEzU6Oz9nJybwNNI=;
        b=tDkIVrsnhlC7EorEIlVCrt2Bj1tvrpK9AYiS8oRhGDKhQf264ZOJdcMy5paepFISve
         tUaYCn33hCGyi6kVf+A43yljTjDAXyRx99lijdNFavSpKu4ThITeNK0Ixz7oTv0ENsRG
         nU2V1iWdZh6k7mMaTVCsELW0rI5x3eei1Nu5haQkaLHDUahKGdWL5tkLudoGOQ00LMPd
         k/OxJLUgd9hubSTILqi4Q4Li11fpRaanKGr2Ldlbup5MeV8r1Z5x0sHKgjE88pk3nFE/
         FXJ+AZmbwXywIolQNeEguHq75lxwW2fg+FW7xIj33yGhuo+7W7Di4jNXyoGmCuRO8+gu
         +Etg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778254041; x=1778858841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IY5VpH1QCqNL+Hxqm+EMdHN3zeBtEzU6Oz9nJybwNNI=;
        b=jNGdb0pjehvK1CoCyFE+nDgMW/Lmq/XPCp+VIKHeefPHhjx4umllqXuGKtvOcdtBwW
         mLCvccpYeCc0o1eUWkkm3q4jFjXoU+uwj2wtyhVa9VRli9LSTP84HBFCeKZOC9Gg2qxq
         oeMk0/tnVfTVVga8R9lkZABApnROs+WLJUPiGAg8XzrMIh9iV3poIkqS9lZ9s0CFcJWs
         F5zKiEOZ7f/l2rRTy5HrG5bx6S5M1gNl3vTQeoCNOySb6l3FbsYSDbHNYtZNlQx/fEV+
         tL8nExcxkI7e2rpgG/III3igzHMOFEj/VfcgnrDEYIPhjYzLa7sVbfHp4/1koOv5J6zx
         7Bvg==
X-Forwarded-Encrypted: i=1; AFNElJ/CX/nWO5iEsJqVaAKkvvDwoIeoE8Z/ZH/xQ/f3deIPLz/ZwtVKDLwp51WTHCcOTBM5jxauHPDYriHD@vger.kernel.org
X-Gm-Message-State: AOJu0YxPsUhyZw0gt4EFl7Y79zEg8HrffcFK4YWogAdoKyJVUXumR/aB
	rpjnVIdEm+oG2WVmqsHGn35oumCkbWpVqYqBsErHr0wbHpzWhkaCdxq5
X-Gm-Gg: Acq92OGWFVvRRmIQPxd05+G5S2m1T+qdhbRPOZExINGATy6MdVqIxbGsTxIn0Wtmj9c
	0oO6uPetPFCnbD9zKsQHfjjLpdTD72j6a5u/wU4QupfFw0LULSTNvTlPO0uULcADDfdgjI0Vr82
	mtfJ11qRzpeSNjCYSrBxuxFcyXqC1KT17xQ/WTsX/OnKTfu0vClpF+4SnAl/cPBZTuCz16Mohv7
	ExOT8EUC8kf0lgVnFvqzFTh3eo4BFPSAfNgYkHT1jZww+PoXx2/O+1ixdgqVv1dENuPU+GYsBpU
	kO7fVrHW/7eFAKEHi2RG6IQWdEyUpMH+K+m4DNqEMFRf4U/+3vwT2ZUBECAP2XtRTo7GyhGmerr
	oIbXXHFH39pUVD8HReZfBtPEiKsFigWCpf6beUepHKGl+XRpYHvTZixsoSkFshU1JaedlRxa4O4
	OPIYUn2Vy0Yc1tyTEllhvYJLFMJB4UgD9fs+02azIf7Lhwe14=
X-Received: by 2002:a05:7300:434f:b0:2d1:299f:521a with SMTP id 5a478bee46e88-2f54a38cc95mr7218915eec.26.1778254041341;
        Fri, 08 May 2026 08:27:21 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a53:11:5d6e:9aed:ce1b:4ae9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d43b4sm2535486eec.11.2026.05.08.08.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 08:27:21 -0700 (PDT)
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
	Jisheng Zhang <jszhang@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Robert Marko <robert.marko@sartura.hr>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Tony Lindgren <tony@atomide.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 5/5] arm64: dts: marvell: armada-7040-mochabin: Fix is31fl3199 shutdown GPIO polarity
Date: Fri,  8 May 2026 23:24:22 +0800
Message-ID: <20260508152435.21389-6-jerrysteve1101@gmail.com>
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
X-Rspamd-Queue-Id: 2427A4F8B66
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
	FREEMAIL_CC(0.00)[gmail.com,ucw.cz,kernel.org,foss.st.com,atomide.com,vger.kernel.org,lists.infradead.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-8059-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,lunn.ch,bootlin.com,gmail.com,mailoo.org,163.com,arm.com,sntech.de,axis.com,sartura.hr];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.64:email,lumissil.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.1:email]
X-Rspamd-Action: no action

The is31fl3199 shutdown pin is active-low [1]. Correct the GPIO flags
from GPIO_ACTIVE_HIGH to GPIO_ACTIVE_LOW to match the hardware.

[1] https://lumissil.com/assets/pdf/core/IS31FL3199_DS.pdf

Fixes: 737929191283 ("arm64: dts: marvell: add Globalscale MOCHAbin")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts b/arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts
index 6bdc4f1e6939..cf690a85cc2a 100644
--- a/arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts
+++ b/arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts
@@ -236,7 +236,7 @@ leds@64 {
 		#size-cells = <0>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&is31_sdb_pins>;
-		shutdown-gpios = <&cp0_gpio1 30 GPIO_ACTIVE_HIGH>;
+		shutdown-gpios = <&cp0_gpio1 30 GPIO_ACTIVE_LOW>;
 		reg = <0x64>;
 
 		led1_red: led@1 {
-- 
2.54.0


