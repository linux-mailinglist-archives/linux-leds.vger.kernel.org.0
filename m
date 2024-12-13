Return-Path: <linux-leds+bounces-3604-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 893A09F19B3
	for <lists+linux-leds@lfdr.de>; Sat, 14 Dec 2024 00:11:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DF4318898F5
	for <lists+linux-leds@lfdr.de>; Fri, 13 Dec 2024 23:11:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B21B1E47B7;
	Fri, 13 Dec 2024 23:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="jcL3M9Q6"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831A81B87EA
	for <linux-leds@vger.kernel.org>; Fri, 13 Dec 2024 23:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734131471; cv=none; b=LpWZH+HXDWejTiA9ZJuYbD0P/MdBo8FrcSOOWM3Hm4bcL+kPdLmaB2+NrU7RvcRFjPuaUGvs9FGkZ64VO2RjaDoXvhH2aiNdnnxbyY1fVE62csEkYP3FX8NJumOgSHslWY/cpOFETzx4UZKGDSMkVAwTjiATPli9zW9zt2aFNls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734131471; c=relaxed/simple;
	bh=OElGuocFBxJIIUrP083Z7WLSceoDIf+47W69Zfej10Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lnCzgpXDisGnNia+9L9Qo+rKlMT5MCMgW2myDbqs/wAPJvWh1W8pYVJPvstyJZZXvmhkKLoftd9ActQQi9ssoWdnD2PWL0+kW7TV7poaQyhZhcnDjqHGXfXWtLnq67gtORAqnFrqxXZJEcLKJ9EKijTbyb/fHHh8sPp5F1eR38U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=jcL3M9Q6; arc=none smtp.client-ip=209.85.221.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-3863703258fso2023798f8f.1
        for <linux-leds@vger.kernel.org>; Fri, 13 Dec 2024 15:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734131466; x=1734736266; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RleFjP8P+hY5wroaEP2jlCc10s2ZwVlQ4JJ/qX8KAhc=;
        b=jcL3M9Q6E2FhZpVsqYKYpeGI4Led6kP5xIOOABVRoTor1z//amuCn29M+5sv8WUhck
         IRVs2PGzKhPwPF4VE2DelIBCERER0KjGr5BvuI3+BYVQhkOdDJYgqdR4EANdn9Kt7/ca
         FxvV8o1t6UKGV55gh3vucQxXwod9FDqMI4BJAOp3OocMdsNwetY+FpOWvv2gW4ToUgbG
         1dZWGtgHwfBS2YohhEocdxhEFtShv1BGtQTmjQIXrGRalO+SldJLqY597ktIq4pW225D
         v+BMeyCalwFbEcWBjqzZv9k1BaKU1R8GFKVqAHM+wbGkErFHOKwu0Fb213oWdj9CIuvj
         Wedg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734131466; x=1734736266;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RleFjP8P+hY5wroaEP2jlCc10s2ZwVlQ4JJ/qX8KAhc=;
        b=UipaoUzKJYiHPiPIFuZ8Q11BKLPqWamrsFmHxFjPJJAr0lHaVUpXHAyY+94QMYXvov
         kBEzgIaHWZm+D3grdidpUV4XVUfBl38+BwXon1i9Zho29H1+BQzW4bd09DZuEmpYVE7k
         Ycf281KFDsWALVZZr98O4tIDI32hMC0sOt0crblMU/c+FRS71ADRtBARn37Gg7GxKbyQ
         9M15dALCSt5YqXfOtsWd4PSyLRUeNgl50+nL1hKZL/iyi6kFNkbUfTHCwIqDmU9Mjfy+
         7VSKSlEcO/bJrX4J2THfmLWPOifHfsURl0p/2TgpR6M3nEdKs/Hur/5h+cc7fujz95+Y
         P9Vg==
X-Forwarded-Encrypted: i=1; AJvYcCW/qYglCcPrhCJzeilxIUAZcfs7Pw8bAfE7NLQD6tZUUwoTT5osAu3eyHKI2JMBX4lGu2y7705rfCXm@vger.kernel.org
X-Gm-Message-State: AOJu0YyzP7SVxWiLpNzV/33QkO8mgW2MRylE2aXWk4buoBeS1ZjBH2lt
	LvQkfnj+ACyWiSfwTFGvTPMzJrsVrYZHXW9j28D87zz9NKo1nXIZlsqdG2nG1EE=
X-Gm-Gg: ASbGnctpbFD615zOv5VNHzqc6qaf6v6bfCEEfFeLn8dfc3ezf6Tm5643cTb7Xh87zbd
	2HvyVrZ80ORzHma1698cS4sN4iJxZURWf0c13gjtNpRyqFxgz/Scv1zIY0cNL5o4YKyYK2zVYoi
	6eXqcOgsHLx2HpFKrDnlEjkfTMFx51g95JSiFjy35Z4OnGHcujYjDIu8LO3REmm6r8RlmUf2DXh
	AWu0QhCQI90SvYVe4eOe8rrdXjMSo7mxQeKWMy0s6VaLwurCx66L8Vd4NU24g==
X-Google-Smtp-Source: AGHT+IGH+A2zSoGfdDUqRz/MypEtePhXHPxM5OeuowVDk/MmcBalDiqAbeCGLKjxq46/rfGJE7iVHg==
X-Received: by 2002:a05:6000:70e:b0:385:e8e7:d09a with SMTP id ffacd0b85a97d-388c3645ec2mr3607062f8f.2.1734131465615;
        Fri, 13 Dec 2024 15:11:05 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c80162ddsm781752f8f.37.2024.12.13.15.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 15:11:05 -0800 (PST)
Date: Sat, 14 Dec 2024 00:11:02 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jakob Riepler <jakob+lkml@paranoidlabs.org>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>, Jakob Riepler <jakob+lkml@chaosfield.at>
Subject: Re: [PATCH v3] leds: pwm-multicolor: Disable PWM when going to
 suspend
Message-ID: <2wirsrr37nwo54k3fqh4xejzjidjclc5jvw6fjl657ytmfquof@ygqsovx23h3p>
References: <d7d930bc-4c82-4272-b2c6-88f7cac5a3e1@chaosfield.at>
 <50bbd767-b0e0-4788-975b-f5d9598208e5@chaosfield.at>
 <20241212174356.GJ7139@google.com>
 <d021d011-d5d4-4692-973a-f5a45be8db94@chaosfield.at>
 <20241213163445.GA2418536@google.com>
 <20241213191039.181169-3-jakob+lkml@paranoidlabs.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yuj22ghi7qkyo5dk"
Content-Disposition: inline
In-Reply-To: <20241213191039.181169-3-jakob+lkml@paranoidlabs.org>


--yuj22ghi7qkyo5dk
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3] leds: pwm-multicolor: Disable PWM when going to
 suspend
MIME-Version: 1.0

Hello Jakob,

On Fri, Dec 13, 2024 at 08:10:41PM +0100, Jakob Riepler wrote:
> This fixes suspend on platforms like stm32mp1xx, where the PWM consumer
> has to be disabled for the PWM to enter suspend.
> Another positive side effect is that active-low LEDs now properly
> turn off instead of going back to full brightness when they are set to 0.
>=20
> Link: https://lore.kernel.org/all/20240417153846.271751-2-u.kleine-koenig=
@pengutronix.de/
> Signed-off-by: Jakob Riepler <jakob+lkml@chaosfield.at>
> ---
> Changes in v2:
>  - fix wrong line-breaks in patch
> Changes in v3:
>  - use git send-email

Applies fine for me now.

I already gave my Ack for v2, repeating it here to make it easy to pick
up:

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Please add this to your v4 if you have to send a new version. I don't
know how picky Lee is, but the email address of the sender doesn't match
the S-o-b line ...

Best regards
Uwe

--yuj22ghi7qkyo5dk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmdcvwQACgkQj4D7WH0S
/k6olAf8CcSJDZ5DZNy0nqcPbq6lK27YNAL+oWhoEKMriLGjePuHCy7XQzdXF0xF
Ja+bElF+5/J2zVkBpEjmZDEEQ8peGnUJ+r2RWAhpFLkeaZDLPQiwdKEAt11mLr4R
vwtF2X7L6zJ5DR1NS95DkVtkjXXQ7D95cfQM7c8Ix5bVx2dFncqZc+ZiROx1s44I
u4z00x3NGK7jlC6nBzmimKjxIXK4dSidFQZY9+UdCJqkodWgn7v3yQ7USsD3U7e0
5ryKQjy4uHUwl+k4Pz0kQpjfR1FZrKTaoapwGQaGp5E93AL+6HvIjRIFzIKQJ+rg
qbDgp+SbO6yfQzhaYbhO8oyCfnXR5g==
=zhX3
-----END PGP SIGNATURE-----

--yuj22ghi7qkyo5dk--

