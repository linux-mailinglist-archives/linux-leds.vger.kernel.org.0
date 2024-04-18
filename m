Return-Path: <linux-leds+bounces-1500-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 048A88A93F3
	for <lists+linux-leds@lfdr.de>; Thu, 18 Apr 2024 09:23:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7C514B2131D
	for <lists+linux-leds@lfdr.de>; Thu, 18 Apr 2024 07:23:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 889CE1B94D;
	Thu, 18 Apr 2024 07:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JyfI01Eb"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DF86A342
	for <linux-leds@vger.kernel.org>; Thu, 18 Apr 2024 07:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713424995; cv=none; b=mS8p0F9NnjohrY7eMbd3qZRb6ODjvdnEevFI2ezt6Q2FMWza8Zwj8Bw6IEXf/VqwuCr6S+FjcJYSrxoJiHh2oUkSwPiXuQAhXD//K6+lB2sN/rMJOjHwsWg6jZ62vhTQ3gI8WwQMBWslCVqCB777fjgnb9k7O25YKOZ1IEUQXCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713424995; c=relaxed/simple;
	bh=vgK0r6JlkgRyVng0vK7xeA2Mb4CDysk3xJwerY7ubwc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sVblTNulnrJ5IsFZTwovbwCkYvxcwDQ7orPfi8kpMJ061KAUfsD2QCf8exu2Qm8AUzQScqggsGnP/9Vk31SMddFWyh+phKeOypx73vbt2a5m3PcH5e2w8Dh7vR7g80yMA9PJjmjNfizFV7T8RAF6W9ByjXYIuURrbAwdCg4HjZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JyfI01Eb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713424993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cVEgCUNH2+ucbxNW8o7LrLo4xbai7FQO2lfQoIgrFHE=;
	b=JyfI01Eb2TKluRAwVxLOUBAZNdbkQ+eYGTR+qKp9O+Qoi0kE2wfIfSvB38E+9AdLkdKOXO
	aJ5KMOukmLdF4whpZF2dd+D5VSGFZc8U0c8gdyNSUkLwHJAyR/eRrEZMwvVtIYoX0tnGkK
	dABRp8sbA/qsff3JZJCs7oGS28RiK5s=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-HIlKIi1FNPiOQrPBsU9PpA-1; Thu, 18 Apr 2024 03:23:11 -0400
X-MC-Unique: HIlKIi1FNPiOQrPBsU9PpA-1
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-6ed03216b70so857983b3a.3
        for <linux-leds@vger.kernel.org>; Thu, 18 Apr 2024 00:23:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713424990; x=1714029790;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cVEgCUNH2+ucbxNW8o7LrLo4xbai7FQO2lfQoIgrFHE=;
        b=w4dFZbuMhZyKWD2FWer7lJyMVGuSGL09zyJQVbLN/oPBN06fFCrzhO9rpCDawGvNLq
         FrsKZMkuUDCyCsR7Ud74/G7JA7B7Jboz0wV1BOZ3Y9gaxBe5fgnWfztegtjN4+7ArW2R
         gWxfHrLZOBSsHHKXWTynkwaxf6de2T4LenfM0iVEWUqQwI61Oapmj3deoiLG0TwAgncc
         XZEHYygoPKHArXVGlhtzmt7XXTR06DkPuf9Ow9EpRUzJkFUZTlxqt10UXC2s+K9C1lwu
         nMJ0f+RrCl7ZpQx7IquWxAo+DoIsX9TkXqvfMM11yeIIsyd92yh5IhDRuYrwL/SeUOyN
         MIBA==
X-Forwarded-Encrypted: i=1; AJvYcCWdORhXy9Q+Ob1H86Q5zFi9ftjRdWnDhT+BIJQ3VuCp5P4hSKAfIzjTySHFmMQzf9+8+WyQcGl7Qx+Edf+vAwc3Ibcau1KPx+BXJA==
X-Gm-Message-State: AOJu0Yy8Qx2X+R5ZadYbO8TIM9/VAh5ZJw6WNaB8ez0flzTXmylXcfJz
	7XTUM/RWQ6xsMNTiinFoiSUOIijmVxj04JnPIS/BP4zgD8FZKB/E1gc7npLwsgo3AV3jU0jSD66
	evQ4PRyIpZKxJ/OgLx4axNXo8ZlQPvH/e2arCBVfJYZ29bXoovQ2mrK6r60JepH1vPNkuRVbulg
	8jMgGM2bShJBrD0EIST6thCTNUwY6Spx2n5Q==
X-Received: by 2002:a05:6a21:999b:b0:1aa:66ad:6094 with SMTP id ve27-20020a056a21999b00b001aa66ad6094mr2646445pzb.8.1713424990629;
        Thu, 18 Apr 2024 00:23:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFb6KDSdMbWA5pEE2/RfPBEDrTWyeMJrakgp6Dj7adISR0wr3x3K1kxRaRUXVxLHPRcarcIGEu4VMy3oL4mikE=
X-Received: by 2002:a05:6a21:999b:b0:1aa:66ad:6094 with SMTP id
 ve27-20020a056a21999b00b001aa66ad6094mr2646428pzb.8.1713424990300; Thu, 18
 Apr 2024 00:23:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240416053909.256319-1-hpa@redhat.com> <20240416053909.256319-3-hpa@redhat.com>
 <CAHp75Vdw6gCN=45iRdKcm=qT07Z90+z6Cw=inYR+C6+5gML+_Q@mail.gmail.com>
In-Reply-To: <CAHp75Vdw6gCN=45iRdKcm=qT07Z90+z6Cw=inYR+C6+5gML+_Q@mail.gmail.com>
From: Kate Hsuan <hpa@redhat.com>
Date: Thu, 18 Apr 2024 15:22:59 +0800
Message-ID: <CAEth8oHx66Q8esGNNgXnOOT2RJXTFMAo3RJPLHDYh9oewxJKxQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/5] leds: rgb: leds-ktd202x: Get device properties
 through fwnode to support ACPI
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	=?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
	linux-kernel@vger.kernel.org, Sebastian Reichel <sre@kernel.org>, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

Thank you for reviewing.

On Wed, Apr 17, 2024 at 1:29=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Apr 16, 2024 at 8:39=E2=80=AFAM Kate Hsuan <hpa@redhat.com> wrote=
:
> >
> > This LED controller is installed on a Xiaomi pad2 and it is an x86
> > platform. The original driver is based on the device tree and can't be
> > used for this ACPI based system. This patch migrated the driver to use
> > fwnode to access the properties. Moreover, the fwnode API supports the
> > device tree so this work won't affect the original implementations.
>
> ...
>
> > -       int num_channels;
> > +       int num_channels =3D 0;
>
> Split this assignment, so...
>
> >         int i =3D 0;
>
> > -       num_channels =3D of_get_available_child_count(np);
>
> ...it become
>
>   num_channels =3D 0;
>
> here.
>
> > +       fwnode_for_each_available_child_node(fwnode, child)
> > +               num_channels++;
>

It will look like this:
       num_channels =3D 0;
       fwnode_for_each_available_child_node(fwnode, child)
              num_channels++;

> ...
>
> > -static int ktd202x_add_led(struct ktd202x *chip, struct device_node *n=
p, unsigned int index)
> > +static int ktd202x_add_led(struct ktd202x *chip,
> > +                          struct fwnode_handle *fwnode,
> > +                          unsigned int index)
>
> Why split over 3 lines? I believe it can be still two or one
> (depending if you use a relaxed limit).

Make it to be one line.

>
> ...
>
> >  static int ktd202x_probe_dt(struct ktd202x *chip)
>
> Perhaps you want to rename this to something like ktd202x_probe_fw().

Sounds good.

>
> ...
>
> > +       fwnode =3D dev_fwnode(dev);
>
> Will be no use if the bellow applied, right?

Right. It can be dropped.

>
> ...
>
> > -       for_each_available_child_of_node(np, child) {
> > +       fwnode_for_each_available_child_node(fwnode, child) {
>
> Use device_for_each_child_node() instead.

Okay.

>
> >         }
>
> ...
>
> > -       .shutdown =3D ktd202x_shutdown,
> > +       .shutdown =3D ktd202x_shutdown
>
> Stray change.

I know the reason  :)

>
> --
> With Best Regards,
> Andy Shevchenko
>


--=20
BR,
Kate


