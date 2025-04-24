Return-Path: <linux-leds+bounces-4536-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE017A99E6F
	for <lists+linux-leds@lfdr.de>; Thu, 24 Apr 2025 03:45:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B09831946E5E
	for <lists+linux-leds@lfdr.de>; Thu, 24 Apr 2025 01:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED2E91CF5C0;
	Thu, 24 Apr 2025 01:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kri2tD/V"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4C12BAF9;
	Thu, 24 Apr 2025 01:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745459101; cv=none; b=hGmsF0LQYmPGf6DlKc60tfoHNiETLWoGatB2UYi/dmjZMDAMWLbkGBNG2oKd8xEZ1OWiEyYEWP8xhFz78rGfO2LzLSeM+eHgsGYvfcZDRtJ8OdVgNxC7Qt8MuQnHbbhmCJyce1GiMcPxdmPT7fx+UoUe/UhHgKHlh8NIsvgqJuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745459101; c=relaxed/simple;
	bh=0DTdQFoPC4NZ/fiVAZ7wNoXHApmMvr91UpIb5ccL2B0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PyjPahfHCeuOySH07OSmjuoti6unDqtN0BFpLB05E27wUiuHXS2EOhuJ3I5BkBf9JCDdZuIe4KSkHHeW6YPfDSIfxMK1QA/7AbNlM9LDz+LoGS+ygowAncW03sxml4rQPAik2LFd34gJfJ6uAyuqoLUMdnRbJXmqEvKvndkKbu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kri2tD/V; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-224171d6826so6655735ad.3;
        Wed, 23 Apr 2025 18:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745459099; x=1746063899; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5Yuo1xm6v6Xv4QN1cMsc5f5xNd80wm7rmj7HLvoI43c=;
        b=Kri2tD/VvoxBVMM0uJdNLZVvU96ghcWRYsKqU2a7grR3vBIVQ0HON8dUCxpJVdEK/q
         89yyTmzCdY3ZoZxmT/Yr/fyYqLDfSvp4qOmuXmcgbNPQNouw7cttDxNL8ro7z7Rc5H60
         PmLm5ytQKCzsakGpJNYtun9HZf+JqufmhsVi8fCpW3wYuTyR69bZefxK3ffQLckKkRwU
         jXWj9MhdrJ2Zcf/MxD+2k3AR41RuXzx3XI2YoTf7neVQcOLcje7GZ0wsURF+XgD4zk5T
         u6OE5uRMKxtcO8TDho9M+GpiNIw5F385XX2/wMC7zGFnsahETC3w+Y07RuBRLWMaem1w
         JaeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745459099; x=1746063899;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Yuo1xm6v6Xv4QN1cMsc5f5xNd80wm7rmj7HLvoI43c=;
        b=D2JvtWvEaSTmJWlPPO5bI1llgTRmlEd2rDtVJiICl4P/I4/GJdyaiChCsR6Cv7DMZe
         yn78G/5K+I/qi9im+7vEVDliBbBomuRyTmSPMIVxa2ZTvkaZrvexoLkf0IC08/WKEANX
         fahbiTM7NEFICJyR9yZp5QyfLfervMwazuBA54vKsyr4ugCbiDvzeTsD5T44dE72oTha
         TU3Xb16Fl2S86OSMLoc25Q+3meui4z3RbihRqYmWMVGVlabDnsz9rRlPPGjMiT4mhVaR
         7zRpX8IpngX1onetXvrO+j3GRmUdjxMXSc1UPDB7S+Dv96XNJTGbK6EgT3G0MyX94sG3
         6jjA==
X-Forwarded-Encrypted: i=1; AJvYcCW8iHwml7wWZ+OS+DubKWVj96oDcZozh3uuv+g9Lsvk6HPVBBWU0Od+ZM3ivD8oZ7OVmlRvedgAmns=@vger.kernel.org, AJvYcCXUgC5l1o8fREgi71VL8nb34FwMtGTICODV/PWKHqDhhjPs918Z5ZaHUG02LWuXDm+hL4WrT9jTuAr+E4I2@vger.kernel.org
X-Gm-Message-State: AOJu0YwSyeXZ4cy3QwkR+hM4fcUeKalzhrKnmhMV/ADwezRi6Na+QDeR
	trAS4RrJN98DNFgOwKmFwxs+kamaSXPvHr5GOp+jLa3sygTnM/eALn1C9Q==
X-Gm-Gg: ASbGncsOU6TfAGHjWtYkrmRf1WDC2pmu1DN5ucTbXibPF+/lJhvlwSZUUL/2Yg85rMl
	4aS85FlB5p71Um9/oXlf53fTqYcLQhdWqBvoLnifUixl8l7nBwXWxBeufd6Th4TNKekplSNXNQ5
	GVZhFUe6nH7nMQp9gYN7XvClO/+fDVlwL63j11uZ7mvHPLmkbglmIu/6gztlMsd2PGZcjD9+XJr
	yYyu8jUvoh/Wc23K69ZeLzPbseSmUCKRDZCbaA0pUX4OYEYYOuJC7YhaCaCNujQ9RD5/bPHYay4
	fn87ZDC0iDoVo4RlYRSXKn/Duy3aIdIcs3TGFGe6UIYF/pAW+0Y=
X-Google-Smtp-Source: AGHT+IF+iEdF6PMC5k3FVW+mVl9EA3vC6IV2+ro3aTAU8CZOU3kYlxFez+yDvag0ycR4pXrSTbKqBA==
X-Received: by 2002:a17:902:d2cb:b0:224:1781:a947 with SMTP id d9443c01a7336-22db3bd171amr10638345ad.21.1745459099285;
        Wed, 23 Apr 2025 18:44:59 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e7bb6sm1393615ad.139.2025.04.23.18.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 18:44:58 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 0B5534222990; Thu, 24 Apr 2025 08:44:55 +0700 (WIB)
Date: Thu, 24 Apr 2025 08:44:55 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-leds@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: leds: improve readibility of multicolor
 doc
Message-ID: <aAmXl-XzSN1NzJL2@archie.me>
References: <20250421-leds-doc-v1-1-9a32df7fc6f4@yoseli.org>
 <aAhYDY2DBxFW0yI_@archie.me>
 <a1c58126-8a1e-41dd-8bf7-b2d721421dbb@yoseli.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TV11lkz53yidQ5GN"
Content-Disposition: inline
In-Reply-To: <a1c58126-8a1e-41dd-8bf7-b2d721421dbb@yoseli.org>


--TV11lkz53yidQ5GN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 07:30:08AM +0200, Jean-Michel Hautbois wrote:
> Hi Bagas,
>=20
> On 23/04/2025 05:01, Bagas Sanjaya wrote:
> > On Mon, Apr 21, 2025 at 06:48:10PM +0200, Jean-Michel Hautbois wrote:
> > > +.. code-block:: console
> > > +
> > > +    root:/sys/class/leds/multicolor:status# ls -lR
> >=20
> > The equivalent is ``ls -lR /sys/class/leds/multicolor``.
> >=20
>=20
> This patch was only to add markups, I did not want to change the content
> more than that. The result of ls -lR must also be in the same code-block,=
 so
> I am not certain your proposal is equivalent ?

I mean the output is same. But, I agree with your approach to only add mark=
up.

>=20
> > > +    -rw-r--r--    1 root     root          4096 Oct 19 16:16 brightn=
ess
> > > +    -r--r--r--    1 root     root          4096 Oct 19 16:16 max_bri=
ghtness
> > > +    -r--r--r--    1 root     root          4096 Oct 19 16:16 multi_i=
ndex
> > > +    -rw-r--r--    1 root     root          4096 Oct 19 16:16 multi_i=
ntensity
> > > +
> > > +..
> > > <snipped>...
> > >=20
> > > @@ -71,16 +79,28 @@ may want to dim the LED color group to half.  The=
 user would write a value of
> > >   128 to the global brightness file then the values written to each L=
ED will be
> > >   adjusted base on this value.
> > > -cat /sys/class/leds/multicolor:status/max_brightness
> > > -255
> > > -echo 128 > /sys/class/leds/multicolor:status/brightness
> > > +.. code-block:: console
> > > +
> > > +    # cat /sys/class/leds/multicolor:status/max_brightness
> > > +    255
> > > +    # echo 128 > /sys/class/leds/multicolor:status/brightness
> > > -adjusted_red_value =3D 128 * 138/255 =3D 69
> > > -adjusted_green_value =3D 128 * 43/255 =3D 21
> > > -adjusted_blue_value =3D 128 * 226/255 =3D 113
> > > +..
> > > +
> > > +.. code-block:: none
> > > +
> > > +    adjusted_red_value =3D 128 * 138/255 =3D 69
> > > +    adjusted_green_value =3D 128 * 43/255 =3D 21
> > > +    adjusted_blue_value =3D 128 * 226/255 =3D 113
> > > +
> > > +..
> >=20
> > Are these adjusted values intended to be part of previous block on brig=
htness
> > status? If not, I'd like to interleave these two blocks with "The adjus=
ted
> > values are now::".
>=20
> Interesting, yes, it could be added.

OK, thanks!

--=20
An old man doll... just what I always wanted! - Clara

--TV11lkz53yidQ5GN
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaAmXkwAKCRD2uYlJVVFO
o+ioAQCo+DfJEyr22pDVRXU2C6TC2m9t4dqCvugKM03vuOJjUQD+NiT62QwBxewu
nVSHCLmn5AP79EhdPlTQiPuCcXcqvgE=
=Bgcp
-----END PGP SIGNATURE-----

--TV11lkz53yidQ5GN--

