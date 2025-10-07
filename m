Return-Path: <linux-leds+bounces-5653-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D5CBC0B68
	for <lists+linux-leds@lfdr.de>; Tue, 07 Oct 2025 10:39:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 315003C6B6E
	for <lists+linux-leds@lfdr.de>; Tue,  7 Oct 2025 08:36:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84C812D63FF;
	Tue,  7 Oct 2025 08:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="crNa8lLa"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6393A2D63E5
	for <linux-leds@vger.kernel.org>; Tue,  7 Oct 2025 08:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759825996; cv=none; b=bbcuRbRFZIEbg6G8XhFZN9esUWYh4B6vNyb0fuwjyjCVYug1rX78S7z0aNxqL4IInbOISpFwqVoDdqprJTfi66V7dfIlisoCX2ZNeg2sx28N2yGIi3cHC0M/BY7ltEKfTSQRLoFqjKKdLwGKYBad/7N9hfCQmE2AuJ0Tw8eTW5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759825996; c=relaxed/simple;
	bh=7uAEAm51rLd1FKqy+L2ec4vQm8vIVZoQc5npaYHbk3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lgmXv97YAlDq2SWT6i2OIWXaNmgCg0VRfDs1HHBKbKnJ0UL/FfNJoj56r6ea4sEdd03//Vz4lBHQceDjXx9oDBmwVa0UWmuBdlYYN/osLnl4rBpmmegaikA+nbr8JfCHO8faaBiTd32KPX+UOfraOM/EWJoBEojzf9fG9SAD7gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=crNa8lLa; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-36bf096b092so56400951fa.1
        for <linux-leds@vger.kernel.org>; Tue, 07 Oct 2025 01:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759825992; x=1760430792; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gGiMbjmQn7XfKWV9vHi8Sy/mWp58kUDQTy/MiPcOTHY=;
        b=crNa8lLa8EjqTStdYaRKokAEtj6ea55hG7k/uRyNzMVqXy+uf10NN+PIG7uJG19Q5+
         xnUgyo/LMVKy1cPQlbUpP/GxRgpC3GvPg8DJLURlqRbnf3oPqzm5fujevlLZXND85LvA
         LJJaRC7/5XanRfYaMlFLgIG6CwIjcbXLYS525lycFtpyxpmazKfZ3W82ImhqmRhMOcVC
         /OnGgiNdl2Mz7tKKtXBKL7yYwosEqr0YvSj4w8WSHdmzM03UjHvEe6LL+UbSGYi87OOE
         C1gykKSVP+SPiDrw8cwSiKk3xqvNlT6+mt1pnpp9gbL2g5uvQb3gVSX9/V6x3S3LFtkM
         XwWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759825992; x=1760430792;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gGiMbjmQn7XfKWV9vHi8Sy/mWp58kUDQTy/MiPcOTHY=;
        b=lo2GEGIMXXZ3VW704sV+RxD8k8SFDlFSxdyt7KSHH2+7H7+K/4aJTJrnjvMzeIGcsp
         0IlAQkM4KaqVQYypqK/iN0C5jXv7vKJFAlDv1B9O4rCVIA6j2aM12nA+t3fb/eg6bra7
         F/bV1pV1ZWH/5aGxl4C9s+Zhf4yplfwfr97u5T/M3v7EqnAR36HULIpp5qEZOURqu7xp
         9yrL8BsknWhOYT7OdPAVsQ5obDTkBwUgb21+feHF0qhoBcnimadDcv6J9g6+qHzgv+id
         JpeHoqJR8xmnJq5+IC4amX0PF6OK175PwHXVwImeeEEAKj908Ut2JOhRNczN7WJkr+a4
         2FzA==
X-Forwarded-Encrypted: i=1; AJvYcCWExWHbyhoAXfDEiUKOxGiDe933L7sQ3vjSIkZvNTue9vu/P+2Gl5NfBADTP1wPoW4Ul6BWhLt3/SU7@vger.kernel.org
X-Gm-Message-State: AOJu0YwQZULpAoc5WYLpWiJ9huXofBEuQWJvY1YQAROPgPFdTC7+66Ls
	b6IfKZlvC6OcTsk44t8EZZBpZY5X6AGUrOtx0YCtD2JQac+YAnnxUglQ
X-Gm-Gg: ASbGnctdfj8uDtO4JsAcwZlRRX1AnLozBRjHP3j8YkdAwh1apf++o/t5FYSeWrYcgtb
	Gb+2l0hze7SuSs1s9tQRYwzjhlxjR9bJDfnpxyWkzMPrqBLNPacnawHtXSgZjwQ+VPR3kug1VDV
	5P6nGIpAoaTieyDmrR4iFCR37QkEdRuW8DH/TxVnK6QGUyx8y8pFRN/ho+AhITbYIKIgMx/xvRX
	BnXdt5uYUwh9ZdRUIcrOXLF2VfbbdzcIuwwwX0jH+Kwc1fhivbEsLYmO1ITZn43jdBxwAgOxWBT
	iUFgWXcKC02dVhRS7Xfvwu6hgCwNUz7jxVfExrWns/kvQ3ujDG8Y/UPKhH0jzBThv4FxYvlo/Ah
	UwAhWvxec7WM6obI3j4bLVeOqpYUDeM6yYN8OrYbXwqs1+jqryDeNE9634GVPTjEH
X-Google-Smtp-Source: AGHT+IHuGRguErrXJP9h3pDzhOaJUtpac4R4MsXzz6Y0nXTmBHq4H3FCgsyuBlP6yhqsJfsGeldLBA==
X-Received: by 2002:a05:651c:4408:10b0:372:9505:725b with SMTP id 38308e7fff4ca-374c3837106mr35638181fa.34.1759825992192;
        Tue, 07 Oct 2025 01:33:12 -0700 (PDT)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-375f3b64e6dsm7807951fa.39.2025.10.07.01.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 01:33:11 -0700 (PDT)
Date: Tue, 7 Oct 2025 11:33:07 +0300
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
Subject: [RFC PATCH 02/13] dt-bindings: Add trickle-charge upper limit
Message-ID: <072180743039027b8476525bfb3d04b3dd044be1.1759824376.git.mazziesaccount@gmail.com>
References: <cover.1759824376.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v2C5QlrJAk9yRRw2"
Content-Disposition: inline
In-Reply-To: <cover.1759824376.git.mazziesaccount@gmail.com>


--v2C5QlrJAk9yRRw2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Some of the chargers for lithium-ion batteries use a trickle-charging as
a first charging phase for very empty batteries, to "wake-up" the battery.
Trickle-charging is a low current, constant current phase. After the
voltage of the very empty battery has reached an upper limit for
trickle charging, the pre-charge phase is started with a higher current.

Allow defining the upper limit for trickle charging voltage, after which
the charging should be changed to the pre-charging.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
---
 Documentation/devicetree/bindings/power/supply/battery.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/supply/battery.yaml b/=
Documentation/devicetree/bindings/power/supply/battery.yaml
index 491488e7b970..66bed24b3dee 100644
--- a/Documentation/devicetree/bindings/power/supply/battery.yaml
+++ b/Documentation/devicetree/bindings/power/supply/battery.yaml
@@ -66,6 +66,9 @@ properties:
   trickle-charge-current-microamp:
     description: current for trickle-charge phase
=20
+  tricklecharge-upper-limit-microvolt:
+    description: limit when to change to precharge from trickle charge
+
   precharge-current-microamp:
     description: current for pre-charge phase
=20
--=20
2.51.0


--v2C5QlrJAk9yRRw2
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmjk0EMACgkQeFA3/03a
ocXmPwgAxfL/bnwzJGbWAfYUHNKmQwT+fSbIu0KruqseE4yNXxdi24bAtxHIFSbw
+WR6S46YkHhtZXkD0Ew/skbhuRAaYjmP/NbJYVQdRBj6l5GUcmxtxs3uiadOmaGU
UWa3wakGNMZIdRrOguR7syzu7tq+gc6R0XS7v+EEksiFi9arXBXmknN012XK6x0E
Z/ywhwDzT05HmPuxGV1BtfUd2RlZhfx1w7M9PM4dcNWi0edfB4jgwKNPEUa3A2sR
SfcnNxz+lX34BASK6I2E+zqUfMmg0fBvNCDEC7xbxn98oTU9ceCuj5ADDG7c0wXd
gjb9SctkHZE5Cw67sS2Vg/Lu7E975A==
=b1vC
-----END PGP SIGNATURE-----

--v2C5QlrJAk9yRRw2--

