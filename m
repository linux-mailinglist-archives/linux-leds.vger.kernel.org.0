Return-Path: <linux-leds+bounces-5656-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9093ABC0AF6
	for <lists+linux-leds@lfdr.de>; Tue, 07 Oct 2025 10:37:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 574404F4AE6
	for <lists+linux-leds@lfdr.de>; Tue,  7 Oct 2025 08:37:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C86D32D7DC8;
	Tue,  7 Oct 2025 08:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GvtEzi7L"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9752D7D2E
	for <linux-leds@vger.kernel.org>; Tue,  7 Oct 2025 08:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759826031; cv=none; b=hiUGP6yBuOySpSR6K4UdMWLrSg0VN6AgfMxcZJc3Xlefh+1Q9Wj+ZWYeN4ALBn5mZM/hybB0thu6Gua+kq5QtAnFS1jrMVqAf4dwBeCOEHW4tRkdF5UGx6zNJyM8JEfOY8yYlz0PVRpzsp+g2d09QjUlHqlWTad3QI6JPXV1Fx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759826031; c=relaxed/simple;
	bh=1iY8dgK/r7VYOZvJEas2P75fHwdABfTnDJv6B71gZwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o5ywlCcLKy5gfjdoF9Ei2Vw56cC3kaku91byGIIrYX5oDpkAehf1CL91p8QPjvG0t+MLin2lSGxVhxSGxknHAcgD61ZHjzd6YEJl7v9Ly2o05G3cXDO6o24VJVnvfpwQtXjVREdelPNSiazhQHQkBTROX3Y4LRDgEFdxbA3cAzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GvtEzi7L; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-58afb2f42e3so7084348e87.2
        for <linux-leds@vger.kernel.org>; Tue, 07 Oct 2025 01:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759826027; x=1760430827; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=56U4cHXm/XO+yZsN8UYLacC0NRz5ruIRpTT3AQstYVU=;
        b=GvtEzi7LO++FCpXY5Pwj6ebSKH/tNsC43rHTbEjrKqP9pbyRAfftAvC/UXWEtYd2br
         tnTvfmfAhtXi6sbjedf+dxL3BW3VDl29qv1VzlLq59hYB6TtF+QD6ovw/exd621bMXir
         EZ3rJwkIMKpK0cbzuZv9VAlxXybRJ6iGTSs3qj5GofZ7aAqEsAAl0twjRFz8Z6hvHpoI
         ElJuWOHKQ6wgPA76saqaP066ZYmuFx5JOVN7xn1zahPLdvBhuKiKacQz64LF4d/UQYqf
         e2V3rJo3Z5jHjwLaYEUMOUfhGcqboT1Outv1Pl1NDP+bp/IsD6kNOZcTnjPZWXGjoLfz
         Xwig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759826027; x=1760430827;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=56U4cHXm/XO+yZsN8UYLacC0NRz5ruIRpTT3AQstYVU=;
        b=FXygJqeehZGEgLqKurk9DMRsbqXTNVPZ9V1czilGjZNwGF271eLy6TTl2VneeGzHZg
         yP8Jp/noDVhD8K3CHst2f7y5OMJHIZ/CSTszfdZJ6EeUBg4+yyTiOtUw3Ve6VL7cZo40
         TIMV2hpM/W/LtxlK9nQCpTw2lrTrAem6hu+HPcYTBzyeL4PMQ4a7UdGRZQXv1N4W6eMC
         hPym+fPoeIE2m8OW78r1LMLEf+t6HTIc+1MUS/Gkq3ge324Aj0cW97d37NEri17sWJKw
         NgT3TwYhIS1T50QQ7WMN6JmXrHEi7imLicsnN+QaQqNWMtOYIkMuX0fOWox3Za3qZ5b4
         FbvA==
X-Forwarded-Encrypted: i=1; AJvYcCUzH1PdonUkeYGn3vSeqfICY2tV+tUa+2bFOdjgkYy/dMba1Znh24E15QY73/4prVuycp4rNPiAIJ9Z@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrua33GtMiFrREa/hyt9F44tkVpJ6JN34hfyIETYWWk2t5rgQL
	fp10QFNtLfQk2EKh7dNPEspjUY+/jagQUYW7X4PDfLHfThoe4WBtzyyf
X-Gm-Gg: ASbGncu24fedd0dBrJyRGPkCk87c/fIM3dNxdsYU2VQTCHlt8pf3dz/D7weEohTI6K2
	7DXLBhtpnVJ/yvYjIg6FQinx0oj0tL5Ct/w8yl7uncSNosNmT0eNC7FYHkILjohLPQDoZAF3BJw
	Pvtuw4Eig372cToNa9751HUh9aDjfUngn2LNfDkxq90Z74tlpsIrEAOwINTSYuWT2RtNmwbu3Af
	kEVz/QkfNZgGWuAdwilS5WDuVYAXz6xWICvoq7Wxx5a1EQVK6J9D1m+9uLzrRrBMuopjVh/TElj
	T7px90/RNffMwTfM/nTGA70IKfBmRYAktzF6e3/4TSxf/pDFVr1t/7YRSgl1me4fkq6sjFmYh7F
	f6ttNtCwceyC4CkIw2gaMxU3Cl4llwbn2qwf1JvnWWPKkw3zINX2TMA==
X-Google-Smtp-Source: AGHT+IFPlR5J0y/lc2XUcE6O1X+JtlZJeu/GYYDJksj4es7AGQByzJg+EaWCHdJkoi6q7phUr464xA==
X-Received: by 2002:a05:6512:39d4:b0:57e:7040:9c77 with SMTP id 2adb3069b0e04-58cbba0232bmr5051448e87.38.1759826027136;
        Tue, 07 Oct 2025 01:33:47 -0700 (PDT)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0112480fsm5865665e87.21.2025.10.07.01.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 01:33:45 -0700 (PDT)
Date: Tue, 7 Oct 2025 11:33:42 +0300
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Andreas Kemnade <andreas@kemnade.info>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [RFC PATCH 05/13] dt-bindings: leds: bd72720: Add BD72720
Message-ID: <52a4df1a12f6b480150187d956d0fcd57fe626d1.1759824376.git.mazziesaccount@gmail.com>
References: <cover.1759824376.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Hl5GOwGd5SzFL3hD"
Content-Disposition: inline
In-Reply-To: <cover.1759824376.git.mazziesaccount@gmail.com>


--Hl5GOwGd5SzFL3hD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Add the ROHM BD72720 documentation to the binding documents.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
---

NOTE: The Linux LED driver does currently have: values
bd72720-grnled and bd72720-ambled for the rohm,led-compatible. These are
handled identically to the existing bd71828-grnled and bd71828-ambled
and should be removed from the driver. Thus they are not documented in
the binding document.

Furthermore, the BD72720 Linux driver does not use the compatible property
=66rom the LED node. The Linux driver is load and probed based on the PMIC
compatible in the MFD node. Thus no compatible string for the BD72720
LED node is added.
---
 .../devicetree/bindings/leds/rohm,bd71828-leds.yaml        | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/rohm,bd71828-leds.yaml =
b/Documentation/devicetree/bindings/leds/rohm,bd71828-leds.yaml
index b7a3ef76cbf4..64cc40523e3d 100644
--- a/Documentation/devicetree/bindings/leds/rohm,bd71828-leds.yaml
+++ b/Documentation/devicetree/bindings/leds/rohm,bd71828-leds.yaml
@@ -10,11 +10,12 @@ maintainers:
   - Matti Vaittinen <mazziesaccount@gmail.com>
=20
 description: |
-  This module is part of the ROHM BD71828 MFD device. For more details
-  see Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml.
+  This module is part of the ROHM BD71828 and BD72720 MFD device. For more
+  details see Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml
+  and Documentation/devicetree/bindings/mfd/rohm,bd72720-pmic.yaml
=20
   The LED controller is represented as a sub-node of the PMIC node on the =
device
-  tree.
+  tree. This should be located under "leds" - node in PMIC node.
=20
   The device has two LED outputs referred as GRNLED and AMBLED in data-she=
et.
=20
--=20
2.51.0


--Hl5GOwGd5SzFL3hD
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmjk0GYACgkQeFA3/03a
ocWo9ggAj4GBq9go42smGGQBwidPKeFC80081lry80AjjqdeBzWn8ydINnkvdFVU
OboKgpob0WwNIuyoripCr55U0emX7Pdg/SN9pMPanh2oWvN1A3dZLfPW07smIpfC
jv0WPOIeBqCOfjNRbriaGHx3mGlfjcYEJrt4TMb8JlHJpvYRMDjNzDoGI3oUGEgR
lqnXCPRgb76A+OT1Gnx9zDwm8p2PpVpOnutdlxQ3JtLKpH2XjKUqQM9RhOqJ7hme
ElMvS16kznuAMzBGKD5ByXcYOlFaQlg2d8IMcnUM7W9PmkVKEzoeqfE4XHZN8ljy
RW+XE1gvB9Lc2j88vgeXM9rMxGO0jw==
=CW2a
-----END PGP SIGNATURE-----

--Hl5GOwGd5SzFL3hD--

