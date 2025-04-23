Return-Path: <linux-leds+bounces-4522-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10460A97D1D
	for <lists+linux-leds@lfdr.de>; Wed, 23 Apr 2025 05:01:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C21283B88EF
	for <lists+linux-leds@lfdr.de>; Wed, 23 Apr 2025 03:01:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CC932561DC;
	Wed, 23 Apr 2025 03:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MLIb4Hxx"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9F74430;
	Wed, 23 Apr 2025 03:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745377301; cv=none; b=FFMfv7asWkUtOWRIQiNGePi+OJnBc/M3LLl+5DTo3VOhDIQuxL1ECHkhhfb0K5G7W9jHDFq/Vx11mg7lNZfJoW4VOnOERMFKB+cuiVWOl+aKcSrzeKvkr+zmldSzCrWKY/S0Cn11p++M+xyuKmQjQaRZsIZbLg3ddUvwXSZ0OGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745377301; c=relaxed/simple;
	bh=BAItGtMvUQMaGArBydxBPtvmh5HWfBTAHeLnEo7Qhhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CprrXcwj4W04VTgJuBCz8fq/X/RR+zeX7uuwF+lcxiFyE4RVDgkKUq77VCCDi6JddtsSRvEMz2GTtuaQP2/SQIYcpWylQD7SaIoIeXFjaQrYnxeR0n2ldp/yar2s0mn3xUNnnzYLQe7Q/v8IaZqlVVbdiUqQqQmHrsm3q8NPLmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MLIb4Hxx; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-af548cb1f83so5685919a12.3;
        Tue, 22 Apr 2025 20:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745377299; x=1745982099; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LwxzT9QLt6IshzEG1Tru0bmv2OjKa0OhkfKjCsQ9V4c=;
        b=MLIb4HxxYhlFfDsB0poPcCjYRrXdaw1dw5tRRDwe+wcaoqqVFnpUTCyDh/S9nLUHAJ
         e4ZSM9YTgbMOWlrHBgbHCr5qD0UxHRygNq4ZUVRDsYGb8ZkLr312Z3+4+9vLKlwW+iCX
         CnHZVMuythHRJ35LMo7zAOUjqMe+VE05M6DhSEbqnI0n9KYsJaYbLXrpbLmssxIim2db
         YUEYMISwRN5AXfC49Lvp8HeECsQNOWLief8eIeaboYrf25hiFvDQv+6tBaA/nfMDZUKF
         TBMPSJPt5htRtf5GbITrX+MjUg6OuRMqQRIfVNNSYdPLgRDONjRakVH5+BETcETrjynk
         Pr5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745377299; x=1745982099;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LwxzT9QLt6IshzEG1Tru0bmv2OjKa0OhkfKjCsQ9V4c=;
        b=MVfi1MvA1NTWyTRppUI7nF2nll9D1Wo4q+0eFvC63zhL2tpg0xHerSx8cZrUEo4K5G
         VXyHXDmMuGILEalKAHqcB8NUXSqJYUb/To49oV3n78pcg7BQbcfZ9BeVhPG5LJVlhEQK
         q82YAqt0ow9GwsEDvkLkFvC4dpic5T+FA8aPNd78CpnAr53SbD8mldAKVBw4UrRu4lqe
         WgTX0/8JoJpmcS9kezHDcGZJ2ow2N7d5UVoINU0OgShIKThLfvopyZq77vtf86NBcBFv
         ACJek6m/mSf9VeoSc61vC44TGJ/IUPJqXF9ld6kePrv4vdvTidhiW4yKY7NW9r7/5nJT
         owPw==
X-Forwarded-Encrypted: i=1; AJvYcCUEpsqZ8aB2agHuMnYBoNPNi3QTHRgJTIk7tUuPHL1mkfI4pYIAA3qkwyrUb7evgNMetWnRLgGR5DFAiYli@vger.kernel.org, AJvYcCXcrGRDGO2g5LghPFnit1mjSZZJeA2JxgwBTX+daR5tTuAVIPIXCdeiWhHlpqLv6j6f8XuXJJR6Mwo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSbWtnbJsvBbdjt3foxFat/KBlp5wTKfPAr0WloFWpmXEPrJ/0
	/pARVR9EruhUlz9lTh6nIABV2+yv33C7i46NLLUtMZXogQck2HxE
X-Gm-Gg: ASbGncuH+F1x7hdxE6n3Kt6DYCdgJNdKQhzKKoT5JHyIPBOu7sfWVOne+Eg0SGyugHi
	kXnuTg0CLRHtblKXhRnlu1N/jNH9b85zrWLV5r8k7kfefCwk7axZXuqFBqfNb4+tGcbelUVobsn
	cVo2CgJD45RTQRuvXSL/BULM8HuAscwtMk/7+M448gT/14M8V0PN/gq2tbQlvV65Ew/ZR4VnhfI
	ylAyCNQak+aAbmJqxS6VNrNW8ddow9uvLTUQTVOKFhi9ZPrVv9PqLJ46kq2sBEoU65UIfR/rMIY
	Nif86kTBRRXJr9BYk+BmPe6V1qadm4y1odUDCziw
X-Google-Smtp-Source: AGHT+IG7j5f5kDqzRaacdMWuwEx5CcG85GeEJmOYeCzHIk4y+xMtnsBehjvQW7y9PJSJi4MwyOSjcQ==
X-Received: by 2002:a17:90b:3d09:b0:2ff:5ed8:83d1 with SMTP id 98e67ed59e1d1-3087bb6d268mr23641556a91.19.1745377298665;
        Tue, 22 Apr 2025 20:01:38 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309d3472785sm1573470a91.0.2025.04.22.20.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 20:01:37 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 300974209E47; Wed, 23 Apr 2025 10:01:34 +0700 (WIB)
Date: Wed, 23 Apr 2025 10:01:33 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-leds@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: leds: improve readibility of multicolor
 doc
Message-ID: <aAhYDY2DBxFW0yI_@archie.me>
References: <20250421-leds-doc-v1-1-9a32df7fc6f4@yoseli.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SYRXAiKrxoZNUrDh"
Content-Disposition: inline
In-Reply-To: <20250421-leds-doc-v1-1-9a32df7fc6f4@yoseli.org>


--SYRXAiKrxoZNUrDh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 21, 2025 at 06:48:10PM +0200, Jean-Michel Hautbois wrote:
> +.. code-block:: console
> +
> +    root:/sys/class/leds/multicolor:status# ls -lR

The equivalent is ``ls -lR /sys/class/leds/multicolor``.

> +    -rw-r--r--    1 root     root          4096 Oct 19 16:16 brightness
> +    -r--r--r--    1 root     root          4096 Oct 19 16:16 max_brightn=
ess
> +    -r--r--r--    1 root     root          4096 Oct 19 16:16 multi_index
> +    -rw-r--r--    1 root     root          4096 Oct 19 16:16 multi_inten=
sity
> +
> +..
> =20
> <snipped>...
>
> @@ -71,16 +79,28 @@ may want to dim the LED color group to half.  The use=
r would write a value of
>  128 to the global brightness file then the values written to each LED wi=
ll be
>  adjusted base on this value.
> =20
> -cat /sys/class/leds/multicolor:status/max_brightness
> -255
> -echo 128 > /sys/class/leds/multicolor:status/brightness
> +.. code-block:: console
> +
> +    # cat /sys/class/leds/multicolor:status/max_brightness
> +    255
> +    # echo 128 > /sys/class/leds/multicolor:status/brightness
> =20
> -adjusted_red_value =3D 128 * 138/255 =3D 69
> -adjusted_green_value =3D 128 * 43/255 =3D 21
> -adjusted_blue_value =3D 128 * 226/255 =3D 113
> +..
> +
> +.. code-block:: none
> +
> +    adjusted_red_value =3D 128 * 138/255 =3D 69
> +    adjusted_green_value =3D 128 * 43/255 =3D 21
> +    adjusted_blue_value =3D 128 * 226/255 =3D 113
> +
> +..

Are these adjusted values intended to be part of previous block on brightne=
ss
status? If not, I'd like to interleave these two blocks with "The adjusted
values are now::".

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--SYRXAiKrxoZNUrDh
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaAhYBwAKCRD2uYlJVVFO
o0z8AP4zTmN5lD/WuS5ZzbFW201LkvpK5+CJh1BNpRZUknJkqQD/S1nhav8VoIVa
yAxrs+a+kuWrmf0+DlDvyPHyT9hgMAo=
=ETle
-----END PGP SIGNATURE-----

--SYRXAiKrxoZNUrDh--

