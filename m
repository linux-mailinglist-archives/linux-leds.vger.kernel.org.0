Return-Path: <linux-leds+bounces-1293-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F52F886660
	for <lists+linux-leds@lfdr.de>; Fri, 22 Mar 2024 06:45:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DA37EB2247F
	for <lists+linux-leds@lfdr.de>; Fri, 22 Mar 2024 05:45:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3AC3D2FF;
	Fri, 22 Mar 2024 05:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DFdLleV3"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DC0BA27
	for <linux-leds@vger.kernel.org>; Fri, 22 Mar 2024 05:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711086319; cv=none; b=ZyGo74Wvi4Vxem/6eTDgW1Nsa8QLFYhL62mtkkhtO9XJyNbvpesHlpuj1nfsWD3wCBny3//m/Poh0zYZmdubAsPVjAsvGTDM6onPd/6EOlLxsqW9Gpcr4LXcSYbw4FHB3yJLVFaIIf1T9/a9xtcJuSXPHTZlHPhFhh5tbfpvDao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711086319; c=relaxed/simple;
	bh=b4UeU92r62bIY8HhL/ow3jMfrvwN8JSL7OEhfPL5vDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fNqvUX/2TfQi58Ohv8yAbolumcoy+HLb+xTHVFn4O22KU1sWs+Ka+nM/vnpgY0FdmYD6u28uI4yC1uU8CHtmzbRvvOWkTHfROdBX7cLxZcAX32b9F7spNGmx7X2YZzN5xveLdBzDvWA5zVlxKJH0J1kWo4TOhYDXRBoZ4sivjDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DFdLleV3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711086310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2v9+xfia68QeoWpLPgvZTLinBR+rs9FvXTVbndoolI0=;
	b=DFdLleV3OgTTdRYemq+FzjriHIlnzJQAt4NTgpEm2lwDW1IMiI6LtNIRp8j9ghGpFGwyIW
	0mmvk/pChkoeMv6n0I4hWtb7QtDEAUOUbuMmW5sEXm0bJdw3p1ZiO9ioJNZcz7yM8dp5Yq
	iXtdAdW7kyNXHitU2cJskqzwyMXj9e8=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-156-Fzs-GNB5NbWCa-eOwqnalA-1; Fri, 22 Mar 2024 01:45:07 -0400
X-MC-Unique: Fzs-GNB5NbWCa-eOwqnalA-1
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-3c23bee4027so1730854b6e.3
        for <linux-leds@vger.kernel.org>; Thu, 21 Mar 2024 22:45:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711086306; x=1711691106;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2v9+xfia68QeoWpLPgvZTLinBR+rs9FvXTVbndoolI0=;
        b=ShCwjEX9qkQ4duM1BYFrZ1E1ouJMpcWOVqh0/o38ISHAoHpl+RbfL9OxmlxLZcuIcB
         zloNJebpmFNmJ1bPl6COWUyRVMhvnxam6Uj3ZdEYJIGV18GoT/wWljHsvGmsQ6Fbb5NI
         txuQd8vaPTAIkN4U9aT5ewlz3BthOeeCas4XI2tArvrIGxkVFbrA8gxeLPMA2Do2PRdE
         hesHD4evOoAUaGrt4nP7Uzj/LlDvsgomImBc4YkCnllSYf6D/M+BHRWisLUPbxCDlzWG
         Nzw5C8hheyibi8G/ZqSYn9yRrrBtbSTiv/wq3UrcsDg5KKKTC2c0lC9Ze/ufWgM12O3/
         tqmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFFTCrzA+aHFRnpEllaAYXXB3LY4vHxWJx4Xj/uWRHJn871ckiX0ybxpaVFPRN3TbT+dycw75xYr9UvURWSwBadOzsg4IJwSWD8A==
X-Gm-Message-State: AOJu0Yz3lw9lhnXNVH3M93RTjsMrSvmj9RZJfAru9VGPOuU2ujFTy6wP
	Mj8ijYtdKzYx5hN8X1EQF09K/ISLy5BKaxfMZ9ffkF5YOdxp4sypSqyitlIfGKtt5/6P99lFQOG
	EtCoHnt6yofYA0n2f+Cq5l5fB/Gq4SM1HkPDzq7wHDYvuOkFuj33xOXYt6ZAjfPgzyGK5qwXKAu
	ApNxidpPvo7hYoAOc9Xxj4sXxMD0GHsOX7lQ==
X-Received: by 2002:a05:6808:16a2:b0:3c1:7eac:a8a8 with SMTP id bb34-20020a05680816a200b003c17eaca8a8mr1460919oib.26.1711086306411;
        Thu, 21 Mar 2024 22:45:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjP042aRQsdUdB9ehHITlv37xk5alHFWxpQm2MqNv8pk9MTzqxxtDhf60Pr2uz0kgKfHbuG+XxWZGNk/DWcmk=
X-Received: by 2002:a05:6808:16a2:b0:3c1:7eac:a8a8 with SMTP id
 bb34-20020a05680816a200b003c17eaca8a8mr1460912oib.26.1711086306145; Thu, 21
 Mar 2024 22:45:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240306025801.8814-1-hpa@redhat.com> <20240306025801.8814-3-hpa@redhat.com>
 <Ze-N_y5Tbjc93aRp@surfacebook.localdomain>
In-Reply-To: <Ze-N_y5Tbjc93aRp@surfacebook.localdomain>
From: Kate Hsuan <hpa@redhat.com>
Date: Fri, 22 Mar 2024 13:44:54 +0800
Message-ID: <CAEth8oEdzomdn5avXf44HXpoMFDfGpOjjxPFtaGkh0EhfZsPMQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] leds: rgb: leds-ktd202x: Get device properties
 through fwnode to support ACPI
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	=?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

Thank you for reviewing.

On Tue, Mar 12, 2024 at 7:04=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> Wed, Mar 06, 2024 at 10:58:01AM +0800, Kate Hsuan kirjoitti:
> > This LED controller also installed on a Xiaomi pad2 and it is a x86
> > platform. The original driver is based on device tree and can't be
> > used for this ACPI based system. This patch migrated the driver to
> > use fwnode to access the properties. Moreover, the fwnode API
> > supports device tree so this work won't effect the original
> > implementations.
>
> ...
>
> > +     fwnode_for_each_available_child_node(np, child) {
>
> Please, rename np to fwnode to avoid confusion.
>
> > +             num_channels++;
> > +     }
>
> ...
>
> > -     for_each_available_child_of_node(np, child) {
> > +     fwnode_for_each_available_child_node(np, child) {
> >               u32 mono_color;
> >               u32 reg;
> >               int ret;
> >
> > -             ret =3D of_property_read_u32(child, "reg", &reg);
> > +             ret =3D fwnode_property_read_u32(child, "reg", &reg);
> >               if (ret !=3D 0 || reg >=3D chip->num_leds) {
> >                       dev_err(chip->dev, "invalid 'reg' of %pOFn\n", ch=
ild);
>
> Must be %pfw now.
>
> > -                     of_node_put(child);
> > +                     fwnode_handle_put(child);
>
> >                       return -EINVAL;
>
> Side note: This shouldn't shadow error code when ret !=3D 0.
>
> >               }
>
> ...
>
> > -             ret =3D of_property_read_u32(child, "color", &mono_color)=
;
> > +             ret =3D fwnode_property_read_u32(child, "color", &mono_co=
lor);
> >               if (ret < 0 && ret !=3D -EINVAL) {
> >                       dev_err(chip->dev, "failed to parse 'color' of %p=
OF\n", child);
>
> Must be %pfw now.
>
> > -                     of_node_put(child);
> > +                     fwnode_handle_put(child);
> >                       return ret;
> >               }
>
> ...
>
> > -     ret =3D of_property_read_u32(np, "reg", &reg);
> > +     ret =3D fwnode_property_read_u32(np, "reg", &reg);
> >       if (ret !=3D 0 || reg >=3D chip->num_leds) {
> >               dev_err(chip->dev, "invalid 'reg' of %pOFn\n", np);
>
> Must be %pfw now.
>
> >               return -EINVAL;
>
> >       /* Color property is optional in single color case */
> > -     ret =3D of_property_read_u32(np, "color", &color);
> > +     ret =3D fwnode_property_read_u32(np, "color", &color);
> >       if (ret < 0 && ret !=3D -EINVAL) {
> >               dev_err(chip->dev, "failed to parse 'color' of %pOF\n", n=
p);
>
> Must be %pfw now.
>
> >               return ret;
> >       }
>
> ...
>
> > +     struct fwnode_handle *child, *np;
>
> Do not use np for sturct fwnode_handle. It will be quite confusing.
>
> ...
>
> > -     chip->num_leds =3D (int)(unsigned long)of_device_get_match_data(c=
hip->dev);
> > +     count =3D device_get_child_node_count(dev);
>
> >
>
> Redundant blank line.
>
> > -     count =3D of_get_available_child_count(np);
> >       if (!count || count > chip->num_leds)
> >               return -EINVAL;
>
> ...
>
> > +     chip->num_leds =3D (unsigned long)i2c_get_match_data(client);
>
> No warnings during compilation?
Yes, the compiler doesn't complain about it.

>
> ...
>
> > +static const struct i2c_device_id ktd202x_id[] =3D {
> > +     {"ktd2026", KTD2026_NUM_LEDS},
> > +     {"ktd2027", KTD2027_NUM_LEDS},
> > +     {},
>
> N ocomma for the terminator entry.
>
> > +};
> > +MODULE_DEVICE_TABLE(i2c, ktd202x_id);
>
> ...
>
> > +#ifndef CONFIG_ACPI
>
> Please, no. Drop them.
Okay, I've dropped them in v5 patch.

>
> >  static const struct of_device_id ktd202x_match_table[] =3D {
> >       { .compatible =3D "kinetic,ktd2026", .data =3D (void *)KTD2026_NU=
M_LEDS },
> >       { .compatible =3D "kinetic,ktd2027", .data =3D (void *)KTD2027_NU=
M_LEDS },
> >       {},
> >  };
> >  MODULE_DEVICE_TABLE(of, ktd202x_match_table);
> > +#endif
> >
> >  static struct i2c_driver ktd202x_driver =3D {
> >       .driver =3D {
> >               .name =3D "leds-ktd202x",
> > +#ifndef CONFIG_ACPI
> >               .of_match_table =3D ktd202x_match_table,
> > +#endif
>
> This is quite unusual besides being ugly.
>
> >       },
> >       .probe =3D ktd202x_probe,
> >       .remove =3D ktd202x_remove,
> >       .shutdown =3D ktd202x_shutdown,
> > +     .id_table =3D ktd202x_id,
> >  };
>
> --
> With Best Regards,
> Andy Shevchenko
>
>


--=20
BR,
Kate


