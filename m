Return-Path: <linux-leds+bounces-7551-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGvVHSmvyGlPowUAu9opvQ
	(envelope-from <linux-leds+bounces-7551-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 29 Mar 2026 06:48:41 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D57B350ADE
	for <lists+linux-leds@lfdr.de>; Sun, 29 Mar 2026 06:48:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2C73530071FA
	for <lists+linux-leds@lfdr.de>; Sun, 29 Mar 2026 04:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBB382848A1;
	Sun, 29 Mar 2026 04:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DqazyhMS"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB5027FD6D
	for <linux-leds@vger.kernel.org>; Sun, 29 Mar 2026 04:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774759718; cv=none; b=SHuuGkC7v9VCeASxMau95sm+01OokRJIjvR6UqxiZR4fP+UElFPsmJEkjpBONZEeyjNfmJ1ge77BeHTsLotQT9kXGVKzxJDlpZE/we6GjXeCXQQ9+53epsI5UPNRXbPdThV9vx0CkgKFpuffeSOzGqNrqc2djgWeObrZqBwB0D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774759718; c=relaxed/simple;
	bh=dSmdH/k7eoOG7PHFk1pjfGKztHp9W6X8Whf07jDQ+ww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z8V1LgTWuhYadDiATzXSZmqICmFgSd33iVt7EboecCvyhJYUPolkPmBHoQ1ND7RosXcHdFg8VxcQ5hR/GMt22eZ3P/s8omk+5qKtMeGQ3J82G+Z3D2slGgiTeKqzWqJxIpm6PaDUIQ4lvbj4iNJWILjxd/+1tHzZ0aWDvOsEK30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DqazyhMS; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c739d32b72cso2192358a12.2
        for <linux-leds@vger.kernel.org>; Sat, 28 Mar 2026 21:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774759716; x=1775364516; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4PSFyUSbDPbuxXLaZDXDANomGT/xjqWL5i9LiQ50fiM=;
        b=DqazyhMSxWigUCEHuBdJyHc2ezmc+/kmxcKmhdhJiEvMTZ1S1QkMLH/aiMjxnC5PBt
         WV39dFR5wGEccr3koVzOyFtImKlvlbPkJPYmqIbD6T2xj7OOIVeVr9f4HKvNDN7DjSYs
         NmZSwaYPPVI5okyCwv8JyA4jdQpbwdXUIBj1gyPbxtyC5r5ZmpUe7A7/wZYIuUMEtCqa
         jq4bIYElXGn9zPym4NC0sowxOClk7D7TXT56sMk5pQ1HKMOpLj8GbOAu0510zaNyFygo
         Q1I6fNyg4aQvgetl/t6rWVsqsxtSJuKn5Qral42mZi+GLEYXAOU21JaIWa6KKi0sfx0m
         eF9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774759716; x=1775364516;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4PSFyUSbDPbuxXLaZDXDANomGT/xjqWL5i9LiQ50fiM=;
        b=elDCdRovVaIJACyn8DKRjQmktrewZ4XaE1CsPjdofb2CbfMu7TR1xZCDJmaARtVygs
         4YqNRbRiSKsXu7mm+BBxdNQUmeLBAWfhDHwDZ6hZOg5BmAZyAU52lMBQPawt2bXcqvSz
         Ol/mx8TCQkMqK/FT0kfdVPUMTUglNzg/tN/7AiuMkJtbjtHHn60iQ7TMLjt3vC7Nsvop
         o0qMsCBtaUL6dOOOvanPOhw0t1i/cOfinRboTEd2kruvO3T6SDz5zgAy0yqJLV4Y22gp
         M2IzEaZz67lrOsWEBs0inUas3sIOaMDBNvmsJ3sgmfHC3ExKzxFBtv6Mts0hMA1Qs16U
         ZkPA==
X-Forwarded-Encrypted: i=1; AJvYcCWmDL6WoWyGZXtqax+K775dUbSpolUfyEw9KT+w8c7FP3IvWgCfCgZHfq1/Io8rvVECcJkbDVNhj5Mc@vger.kernel.org
X-Gm-Message-State: AOJu0YyKBQ9ICdl0wdeAO95W9T2F1JPL0kmDnRl2A8ziN2P+Kz3VICrP
	2cO1LvQ3W6tH5/aQwgNxmhTsVFtpRECdLdChxE6FASZKMfPPWnE82lPw
X-Gm-Gg: ATEYQzxNCrxA67DfWvOMbnTFcjsuhPP4pgZew22DsA4MPCpvd93yATQum0lUuK33vaN
	s2HSODwfheJJLD0DU1cRWbMeP4JGf8KvyXCZHqRYxuYrIBYXRlBfcI9YbucvKXYSfDf6eSgiifN
	6N/0Nvb2Ox+YPnra+VtKXJrRZhW240ndhKffLt8v0CfB+qxjuzyi+s68L7y/MJCUxUhdpAGv0JK
	se2V5tiUHwRdug0MhGh2vHSAbiKGTAX+ooFgY6fjwdMj2cPX8wcSvITtop0UYbaYtEdOZsg8JWb
	AYNw8zlxhsO1LU2PgTilrxL7fIyHKsm5kMu4WNSr+iucFRqksxTu5ZbKSH2R2KdqBquELG9a5PM
	Cd+WOp/lvtGksCVfvi0MYe8BVUWV99Y5cxCFM583Gf82jQaBW5cB8HmONgyTY4JT1pafTgZc6o1
	1bNCd3I5z653L1pVHTm9s+HYGnL3ix
X-Received: by 2002:a05:6a20:72a2:b0:39b:cd0c:3880 with SMTP id adf61e73a8af0-39c87abc942mr8576828637.36.1774759716542;
        Sat, 28 Mar 2026 21:48:36 -0700 (PDT)
Received: from [192.168.0.101] ([43.226.29.240])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c769179e31asm2899739a12.17.2026.03.28.21.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 21:48:36 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Sun, 29 Mar 2026 04:47:59 +0000
Subject: [PATCH v2 4/7] arm64: dts: qcom: sm6125: Enable USB-C port
 handling
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-ginkgo-add-usb-ir-vib-v2-4-870e0745e55e@gmail.com>
References: <20260329-ginkgo-add-usb-ir-vib-v2-0-870e0745e55e@gmail.com>
In-Reply-To: <20260329-ginkgo-add-usb-ir-vib-v2-0-870e0745e55e@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, stable@vger.kernel.org, 
 Biswapriyo Nath <nathbappai@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774759680; l=1049;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=dSmdH/k7eoOG7PHFk1pjfGKztHp9W6X8Whf07jDQ+ww=;
 b=GM5n8XUOUONfpTli9uJYWckd8fI5avmePflwEDzxTfZsx2RQwjszif+loZsDybWFVSdzFqK+j
 eH3G8XeAlORBqyrmo3sAktIB8cr4uekcn0LEoIBGnm7E5sJG+33BWIu
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7551-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com,oss.qualcomm.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[22];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathbappai@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,4e00000:email]
X-Rspamd-Queue-Id: 0D57B350ADE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Plug in USB-C related bits and pieces to enable USB role switching.
Also, remove dr_mode to enable OTG capability.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm6125.dtsi | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index a1a296f90f44..d26ca1637330 100644
--- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -1241,7 +1241,20 @@ usb3_dwc3: usb@4e00000 {
 				snps,dis-u1-entry-quirk;
 				snps,dis-u2-entry-quirk;
 				maximum-speed = "high-speed";
-				dr_mode = "peripheral";
+
+				usb-role-switch;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						usb_dwc3_hs: endpoint {
+						};
+					};
+				};
 			};
 		};
 

-- 
2.53.0


