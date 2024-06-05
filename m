Return-Path: <linux-leds+bounces-1840-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1125F8FD0D8
	for <lists+linux-leds@lfdr.de>; Wed,  5 Jun 2024 16:31:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2351A1C22ACB
	for <lists+linux-leds@lfdr.de>; Wed,  5 Jun 2024 14:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86B41C132;
	Wed,  5 Jun 2024 14:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="LzNxukSl"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D9E19D8B0;
	Wed,  5 Jun 2024 14:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717597856; cv=none; b=HLOyloTnKkLkfUg0XHngCq1dlJUA/PWnXwYReiejS/oK0ckR2ZhlQV/G4aA3qjPnO8eIBJKXku1PA/9m9/wRjC0+f1Gno3Fw0W1norbtTxY9Rj6wdrKQCzh8BZDO/IcHCnSPAkRr0Ypjh9sRVq4ieY1qgLGiMChGXRYoerSWKX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717597856; c=relaxed/simple;
	bh=JOpsxfJ0G6PRdrpIjTZPfHtk3rGETkC0ilV8uhYpliQ=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=Rr1823mdu/G/CYASyhIg0c64hyxPwPK/gzH4bBlB4Elpp2xvY0U/Nd99/o6Q9Nogzr4uZcpFROhQ/YYHZLA8y9+H+aDvPqN/VbIcFT05v/KF3UX+G/PrPE8aIxv+6awXAsmeBjt+2gV1phY9M2RpflRlmkNcSVs1jPsVvqoCGAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=LzNxukSl; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1717597833; x=1718202633; i=markus.elfring@web.de;
	bh=DguutoWpY2WySE798EOMwqpqzeLAlf2dBu3Ds8nfwBc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=LzNxukSlI60/8bgRUOtU8D+9/hbz8oJ6w6xS+57Y2susjQDPlrHlaStgYLGBunqD
	 0gdZ78CUAFI+W4JffnsgHRzxkORo8IbMcaPYoGX3t2ngsM3JFFBZ720TYFbealckA
	 ymXLKmq+fF+xkXYzdC0h5Jx9pWVWZJ8XSwjmQcyg1y/Ux8fF5KE5puFaAT7BdTGeD
	 vpgDHaNvjCecXPHa/2NW5fesnXf+hgOYUZIxTyjBdqA9Row6JHLjac0e1+Z/pCzl7
	 ulbhwvy11zmlxlJRSOKfTSIcMt2z4QJyd0m0SeAGQaz8R4w5Vsv9qUvoGBgBg8MlQ
	 ROCEggsB/20qqi/r8Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MsaS7-1sZZ2J49ut-00zl1P; Wed, 05
 Jun 2024 16:30:33 +0200
Message-ID: <5faec5de-fc36-4b38-abcb-c61954a824cd@web.de>
Date: Wed, 5 Jun 2024 16:30:30 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-leds@vger.kernel.org, Abdel Alkuor <alkuor@gmail.com>,
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] leds: ncp5623: Use common error handling code in
 ncp5623_probe()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:e1+zSS4wCoISuWGaAP+d+ZLAcyOksWJ4oMLJzX0TPpZZnhH1sO4
 LpDiymvvmh5fczrDXFJrtfoZHoJfk90Rdq+GXiXIXGCLbCA9N/l1YzQwlc3W16fNoq7fdMt
 WlQmTW1t0lT+XI7iUfEj5Ws84xlDVaTaTZSubFhMmjzKDgcojYYpP6vDd3w4rkeb6N+YSop
 691Xu9AEMcyz1GzyaTLsQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:AdsUg9cqJ0o=;KHrT9osVuRknSYLeFse7SxoDWM5
 3Qwwwf9wx+xLZ+Vw1C1hJ4zYyAk4RXIgAZ75UMLQXl7GWOm0r2P38yoo7I747tnKDSl2MKwDe
 rq5Ex8mnOht5lqpFiLE1B/+bS5AAo/A1XaNEsDmD21oLXPbWs9VsLQmJc1nb+xeFSnUE9ChUH
 QjAviQ1Kiy83++eFGGNwa+fjRThsrtHf3/AtYu+QVwx9/u/KIyu/wZyQ931H/6V2tgyZhGKPK
 svLXshr2oeC3Dia70rCzo18vJug0dbgY7RBhGkgbqre+FqLRdqn1Q3RgNtH1Pw4HIA82q2ZpY
 I198t5XcS4bQdIDzdB/ay+EZbIr6+GpSCCdEr38wI7WZmh6tvWo7Wwlk45iv2KEgUI7hYX09f
 +aeDG6bE5se3mq7UoxdZgdgaMTGAYoc1+SDKUxCgIC4ibRoNv60WWeSX6qFnHIo6Vql168lv/
 tGX6BtSdB1z5UZHryVTJ+VqC+h1urIGu1oq+bm8DsRLk5X2uqa3NNaRybY7hfPKbgvCFJxJKd
 Zji75ESHeTlf/t14OGZG4YxInxClexGAhAVUwSFa/AZjFbwa0xkMVQnVFhIEJNnjAvpyUoiZc
 AI3973Ixqh8vqHzacYo2rxPDj+bqJAO50PBZsO0n/jj7N5DqW7R++8cBTu9jtDUJ6inaRrid0
 9CuvqTlb+5sFRXEzzgPegoCLSYWZKFLvb12Ge/sUWE8XptYaBVUcD0JSrn73uKc5xQ78Dwvkl
 j8fGwdd+eZTxOuO3pV1elxdpZywrvvwQzug3cDiTk52OQojrostspg0HPuuCHCe34vG+Qp0cu
 VDQUQ/RLlSIRDqki9+1QN371F8p1YXsguuY+PgTDf77DA=

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 5 Jun 2024 16:19:26 +0200

Add a label so that a bit of exception handling can be better reused
at the end of this function implementation.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/leds/rgb/leds-ncp5623.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/leds/rgb/leds-ncp5623.c b/drivers/leds/rgb/leds-ncp56=
23.c
index 2be4ff918516..f18156683375 100644
=2D-- a/drivers/leds/rgb/leds-ncp5623.c
+++ b/drivers/leds/rgb/leds-ncp5623.c
@@ -183,16 +183,12 @@ static int ncp5623_probe(struct i2c_client *client)

 	fwnode_for_each_available_child_node(mc_node, led_node) {
 		ret =3D fwnode_property_read_u32(led_node, "color", &color_index);
-		if (ret) {
-			fwnode_handle_put(led_node);
-			goto release_mc_node;
-		}
+		if (ret)
+			goto release_led_node;

 		ret =3D fwnode_property_read_u32(led_node, "reg", &reg);
-		if (ret) {
-			fwnode_handle_put(led_node);
-			goto release_mc_node;
-		}
+		if (ret)
+			goto release_led_node;

 		subled_info[ncp->mc_dev.num_colors].channel =3D reg;
 		subled_info[ncp->mc_dev.num_colors++].color_index =3D color_index;
@@ -223,6 +219,10 @@ static int ncp5623_probe(struct i2c_client *client)
 	fwnode_handle_put(mc_node);

 	return ret;
+
+release_led_node:
+	fwnode_handle_put(led_node);
+	goto release_mc_node;
 }

 static void ncp5623_remove(struct i2c_client *client)
=2D-
2.45.1


