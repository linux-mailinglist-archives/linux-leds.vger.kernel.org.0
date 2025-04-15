Return-Path: <linux-leds+bounces-4481-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F45A891D7
	for <lists+linux-leds@lfdr.de>; Tue, 15 Apr 2025 04:27:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A102B7A9791
	for <lists+linux-leds@lfdr.de>; Tue, 15 Apr 2025 02:26:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D69A3207DFC;
	Tue, 15 Apr 2025 02:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i3xomCJH"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365DB1F4C84;
	Tue, 15 Apr 2025 02:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744684044; cv=none; b=H0TnJr2l/pRRwYS7ETEhlL/GjIgibUA2RTUPYhHiiq+MRPBnsDc7ilsw3/HYqSE23+fKb5I7g00Lu2qLlSeu6VNVxBtz4j52ZNQS9VXQP7BwfL9io/fFOLbDcVlLYR2bXL+RxGuCm6t7qVcuP2AFL3Eyc5LLkNYp8Y9iMjO+O7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744684044; c=relaxed/simple;
	bh=MS6EysD23VjLdj+RMi75vnjwBap4RjF89j2Ujy/2KPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JQvUQf3hFQMwnfk7lgahVZOwIwK+cLJKMbGYAhRvpOY1R5ZNjx8J2ub7r+psztd8yM6nnkjOrmDh8IbPP6a22HmCNmWk+5RynLLlu1Xn31B6Y93otmWGYKCew2yXJoQ7rRAUxQVMJhbF87BIZ07JeFlyD2CDfIvc4nErKwvzd4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i3xomCJH; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-301cda78d48so4617724a91.0;
        Mon, 14 Apr 2025 19:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744684042; x=1745288842; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O15D89FO56XI8MNfU7wmkDFxB94F0rcKshm3G4RRbz4=;
        b=i3xomCJHVwKEnkdV9Nznsw29Nto0rv282P6U0n1m6bDQW/ziT1QYj0wVAokmONRJM0
         OlcByx9nnxISzOP/JCafKsp6IbH69TC3rUAAqSbAo0uDX/pgGK7QvckkKemI9mUvtZpp
         ouobmKes+ppXb4gGxzyMUBn1zTFwhMk0xSqWBNBYN+ZZM1ZFiiY81X0WY2MigorRwB86
         AfLO97wHd0f42n5eU//CgQmRYrGJdaUcxx+5lqHtYbSwnJXzx6XBNQr0gAeE+EvaFNkR
         96XDXoCP/3hDw0AjAOT5u8fqyTO2XRo3sUrrfmIIIZO0yaqzoKi9toe1x78Ahs30yNDv
         z8Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744684042; x=1745288842;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O15D89FO56XI8MNfU7wmkDFxB94F0rcKshm3G4RRbz4=;
        b=wkUXaeBP9+vyYkO/81wggAfzVr4mTXpIVYSOzD6Pablu4bfRYHKpyWeJSpjCI88+xf
         wo9ggYmb/sd3+H30s4fhfHS3oKWU0/mjSu6skkKUuU0AUtqlPdoWmp94+tR4sstUM29r
         nC0/KmSH2f99qKWiAvg2yM/5qaqT4t33bG1boWLOsIkBef2hoAJ5RU4CAyRsfPQiOmZX
         aaBDvjJhiHb2R1yIdG/gc818iAquju9E51mLDiPlp03kR+ijVwneiynRNkaR7MFSGIH/
         CfSR1nk586b6DYNnu570vCb8EVPP76UmSHIMyF5g6tFjmvwxGZrDXA29FZtpeHIa5zUA
         ro6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUpWLicoO57QJ7M9ILqMfQdCA3D4gz25Dna5hd3Y0b7a9sOLnZ3fKBLruTRubXdUKRUhT51bLOIg+Oa@vger.kernel.org, AJvYcCWD/OUstxqSjVB0BC4TxAjEqBhnJ0JpIvJXsDd+Qil374Zw+cCRCM0NsLeA84dkQdjQkMi44us+iEF4@vger.kernel.org, AJvYcCWaFlYAK+2DXr35MllfbDto+F/YetJzcd/AB+BqgwZXUhZr6vBi5zTJXWL9VupOIlVm3XHGk8dQ+jzOLA==@vger.kernel.org, AJvYcCWif6gp8f5L6EwJNtzjMA728aLxkP4s55U554JfahTh4spMDI9DAE4p1Ao2e7Nbadq1N+MPOaVrpha495Kw@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3jbQExfr/BctseLxdDsQZq8Tdarb5sSWvU3LZHVfX0o+neDNR
	4xaZi9L7ESgQ3jMcvyECpKrvayMON/8FD9kX7Fyh6CzlNe9g/+0P3qrVlA==
X-Gm-Gg: ASbGnct19fy9I9Acy/auJU1MbPcZP5WS2bOfrZ+Wsk0gF+vlQjHHQ4acWahRkNlUBDb
	fZ8O84oVoh0XWHpAf0pUzsdDdJlhxMzlDaGZadzS1wf6K91n5YTYiH7LOom49sr290xF1GdXD2w
	HKZPUi+z7bz/fMVqhzIJnCANDmQiYK8rMV9ojCZH9aChLrBMcWD1nk8kqd9xs5ad9S/QllB+1qc
	y00tBFtb1h22z44KiNNHlrouY3xnhLypqBvWH+ZpmzF2spBRb0okPuDixSEpYlizn9f8Fai51rR
	6OJdTefBTj1vD3wT7uxO/qLIMjuv/NGlAI2xdw/e
X-Google-Smtp-Source: AGHT+IF7tZboihmKB5Di8tKXtKer9swCSXnzgwtsHGn1m6uNejSyJkaNFB9R/GjFVr14dMO2hAvkUw==
X-Received: by 2002:a17:90b:254d:b0:2fa:137f:5c61 with SMTP id 98e67ed59e1d1-30823639ca2mr27484059a91.12.1744684042051;
        Mon, 14 Apr 2025 19:27:22 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df2fb064sm11900542a91.32.2025.04.14.19.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 19:27:20 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id B51414209E44; Tue, 15 Apr 2025 09:27:16 +0700 (WIB)
Date: Tue, 15 Apr 2025 09:27:16 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Ante Knezic <ante.knezic@helmholz.de>, linux-leds@vger.kernel.org
Cc: lee@kernel.org, pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, corbet@lwn.net, knezic@helmholz.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/3] Documentation: leds: Add docs for Wurth Elektronik
 WL-ICLED
Message-ID: <Z_3EBMmtm5LbQGmE@archie.me>
References: <cover.1744636666.git.knezic@helmholz.com>
 <7f324a9a25ad1ac3a622aa1201cbd91ead80f8f9.1744636666.git.knezic@helmholz.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6Nt9HQRoa9PzXHye"
Content-Disposition: inline
In-Reply-To: <7f324a9a25ad1ac3a622aa1201cbd91ead80f8f9.1744636666.git.knezic@helmholz.com>


--6Nt9HQRoa9PzXHye
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 03:28:49PM +0200, Ante Knezic wrote:
> +Description
> +-----------
> +The WL-ICLEDs are RGB LEDs with integrated controller that can be
> +daisy-chained to a arbitrary number of units. The MCU communicates
> +with the first LED in chain via SPI interface and can be single or
> +two wire connection, depending on  the model.
> +
> +Single wire models like 1315050930002, 1313210530000, 1312020030000 and
> +1312121320437 are controlled with specific signal pattern on the
> +input line. The MCU is connected to input line only via SPI MOSI signal.
> +For example WE-1312121320437 uses following signal pattern per one LED:
> +
> +|          RED            |          GREEN          |           BLUE    =
      |
> +| GAIN:4bits | PWM:12bits | GAIN:4bits | PWM:12bits | GAIN:4bits | PWM:1=
2bits |
> +
> + where logical 1 is represented as:
> + (V)^
> +    |          T
> +    |<-------1.2us------->
> +    |
> +    +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> +    | <---0.9us----> |
> +    |                |
> +    +----------------+=3D=3D=3D|------> t
> +
> + and logical 0 is represented as:
> + (V)^
> +    |          T
> +    |<-------1.2us------->
> +    |
> +    +=3D=3D=3D=3D=3D+
> +    |0.3us|
> +    |     |
> +    +-----+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D|------> t

I get htmldocs indentation warnings from Sphinx:

Documentation/leds/leds-wl-icled.rst:22: ERROR: Unexpected indentation. [do=
cutils]
Documentation/leds/leds-wl-icled.rst:23: WARNING: Line block ends without a=
 blank line. [docutils]
Documentation/leds/leds-wl-icled.rst:32: ERROR: Unexpected indentation. [do=
cutils]
Documentation/leds/leds-wl-icled.rst:33: WARNING: Line block ends without a=
 blank line. [docutils]
Documentation/leds/leds-wl-icled.rst:55: ERROR: Unexpected indentation. [do=
cutils]
Documentation/leds/leds-wl-icled.rst:23: ERROR: Undefined substitution refe=
renced: "<-------1.2us-------> | +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D+ | <---0.9us----> | | | +----------------+=3D=3D=3D". [docutils]
Documentation/leds/leds-wl-icled.rst:33: ERROR: Undefined substitution refe=
renced: "<-------1.2us-------> | +=3D=3D=3D=3D=3D+ |0.3us". [docutils]

I have to wrap the signal logics diagram in literal code block:

---- >8 ----
diff --git a/Documentation/leds/leds-wl-icled.rst b/Documentation/leds/leds=
-wl-icled.rst
index 0e55683e946894..78ee2df33df2f5 100644
--- a/Documentation/leds/leds-wl-icled.rst
+++ b/Documentation/leds/leds-wl-icled.rst
@@ -12,12 +12,13 @@ two wire connection, depending on  the model.
 Single wire models like 1315050930002, 1313210530000, 1312020030000 and
 1312121320437 are controlled with specific signal pattern on the
 input line. The MCU is connected to input line only via SPI MOSI signal.
-For example WE-1312121320437 uses following signal pattern per one LED:
+For example WE-1312121320437 uses following signal pattern per one LED::
=20
-|          RED            |          GREEN          |           BLUE      =
    |
-| GAIN:4bits | PWM:12bits | GAIN:4bits | PWM:12bits | GAIN:4bits | PWM:12b=
its |
+  |          RED            |          GREEN          |           BLUE    =
      |
+  | GAIN:4bits | PWM:12bits | GAIN:4bits | PWM:12bits | GAIN:4bits | PWM:1=
2bits |
+
+where logical 1 is represented as::
=20
- where logical 1 is represented as:
  (V)^
     |          T
     |<-------1.2us------->
@@ -27,7 +28,8 @@ For example WE-1312121320437 uses following signal patter=
n per one LED:
     |                |
     +----------------+=3D=3D=3D|------> t
=20
- and logical 0 is represented as:
+and logical 0 is represented as::
+
  (V)^
     |          T
     |<-------1.2us------->

> +
> +To generate the required pattern with exact timings SPI clock is selected
> +so that it devides T in 8 equal parts such that a logical true symbol ca=
n be
> +represented as 1111 1100 and a logical false can be represented as 1100 =
0000.
> +Single wire LEDs require the MOSI line to be set to low at idle and this=
 should
> +be provided by the chip driver if possible or by external HW circuit.
> +
> +Models 1313210530000, 1312020030000 and 1315050930002 require a slightly
> +different signaling scheme where each color of the LED is encoded in
> +8 bits.
> +
> +Two wire LED types do not require specific encoding of the input line as
> +both clock and data are provided to each LED.
> +
> +Additionally, models differ by available controls:
> +- WE 1312121320437 provide PWM and GAIN control per each RGB element.
> +  Both GAIN and PWM values are calculated by normalising particular
> +  multi_intensity value to 4 and 12 bits.

Separate the first bullet item from previous paragraph so that all three
items are outputted as in bullet list.

> +
> +- WE 1315050930246 and 1311610030140 provide PWM control per each
> +  RGB element and one global GAIN control.
> +  Global GAIN value is calculated by normalising global led brightness
> +  value to 5 bits while PWM values are set by particular
> +  multi_intensity values.
> +
> +- WE 1315050930002, 1313210530000 and 1312020030000 provide only PWM
> +  control per each RGB element.
> +  PWM values are set by particular multi_intensity value.
> +
> +For more product information please see the link below:
> +https://www.we-online.com/en/components/products/WL-ICLED

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--6Nt9HQRoa9PzXHye
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZ/3D/AAKCRD2uYlJVVFO
o7zAAQC2UFTsZIvZVhLpQpC1QR38b/LY5qEIC77YBYCGZ4xgbQD/fZiX+Sa8EHF0
hUjl6P1pxa0VMqnDgZwH73cmDk5NrAQ=
=n4uO
-----END PGP SIGNATURE-----

--6Nt9HQRoa9PzXHye--

