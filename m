Return-Path: <linux-leds+bounces-1373-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 855CF88FAE1
	for <lists+linux-leds@lfdr.de>; Thu, 28 Mar 2024 10:15:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F1401C2D63B
	for <lists+linux-leds@lfdr.de>; Thu, 28 Mar 2024 09:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 619476519F;
	Thu, 28 Mar 2024 09:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LY0KLUfK"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76666518F
	for <linux-leds@vger.kernel.org>; Thu, 28 Mar 2024 09:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711617280; cv=none; b=kPiosD4QjGKyoTq+3ry5fquqVPwvqEF6BxDNtygPHvgg+9RM5fvb0tfedm21o2I2FlarRsA2TMl41mmu8p+w8+415miQQ0mFu03hePS4vkVgST4N6s3BRQkxxsaW4R48ePPyJqL/OzkbP7Ublbs5oTo43AXhUQ0fH9Ofqs5Yj3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711617280; c=relaxed/simple;
	bh=UzP6CMkk2ZXCDOwotQD/gmS6TjH0e7Di7zY0YNpZw5s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R914xhIFcDw4BpP7Uo7T5zjJVdVHj0qCENiyq51kmyBAc/kjknj7eC+lrxvziJfv1jxze0DzgVm7hAzHHqSiwGQ/62cTcEhVa85OyqshpHIzCZndtfnmqTkwozAvipd6u3UqKGzeI3seYZEwNdlbBQR7tIPAcyyrRoPXiGoPTj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LY0KLUfK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711617277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LCPrvGXYWJ8By52IhH6oFnCB7CwZOeHwWNu18OjqJ8k=;
	b=LY0KLUfKjayczPuZx81XXL0MDeiZ88Qqf3+YEYgkUU/MhK8uA1jsGhi8Vm0EVDzTpZXdyh
	rW41Lte3TUUNi7rpvadXJ98z02b+SdP+qNlGSyRz5d1ui098KTvZ/94/cjQA0fBt99/kNW
	qhYuatN7HL1wTyjCmfWavCKV5cLpfYM=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-BSaMw4XdPy2jbWdtZsIWIA-1; Thu, 28 Mar 2024 05:14:34 -0400
X-MC-Unique: BSaMw4XdPy2jbWdtZsIWIA-1
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-29de8002b0bso629818a91.3
        for <linux-leds@vger.kernel.org>; Thu, 28 Mar 2024 02:14:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711617273; x=1712222073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LCPrvGXYWJ8By52IhH6oFnCB7CwZOeHwWNu18OjqJ8k=;
        b=r6gD8MguZRYSrhfDVFZ3RqZ0DPaJb4siwtSkQUXqs17wfoqnDdss9mfTDNAYBUxhHQ
         EaattgL2+8mYAGktwIdLwx9jNU5DruzaISNsAUl6gdNEm9lqmYGYWTq/uVOQ3zdXe3pW
         tqxaIchu7u+GvZyzollYIbEboQPugS8AClYxOmg9GqCgO1Os098o3agoY87cznhoxhnP
         JrXxlre9jIexDccbcQBs5jJhWTTmx3TZ+BdYKHDx4KslPS6TO82b4neO+AHAvDiZuBD4
         CYEWgwgLiHvIde6yDxno+BtAtOAszWN2iiPs0Fhhh2rGKPv3U737Enb7za4KdfpWEtf4
         41tg==
X-Forwarded-Encrypted: i=1; AJvYcCXu24+ANh02xU2YxAznSLZYD8B1xRqwZNbPS+F/XRv7UwwOgdzxoqYG6RjkR3TRR0hXBexl6NwgA2uejY/vIRBclstEJE5t97Yk9A==
X-Gm-Message-State: AOJu0YzVzFygJ3LY4FUeoPkMykBUMvQ4EuaZgau521H5A3Mjxbasj3yA
	DFb6EJ4Y5PTegIJ6PRAn98lkiRFNxdDu23+636oLKBIqYQXv3QOVx3SRTwWR+YlsucKWyuM190q
	4lc5WYK7fLHr/RtsRzpIS6KxeFdJL+zUnqoRe+zJ4nFHtNjvXok19+GxifydJf8GYQeSHOAItAR
	+Az5LihicmmcgXNV4uo8B6dDdMAVwBQYnYwA==
X-Received: by 2002:a17:90b:4b8e:b0:2a1:fa61:c36f with SMTP id lr14-20020a17090b4b8e00b002a1fa61c36fmr2296331pjb.6.1711617273110;
        Thu, 28 Mar 2024 02:14:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFi3BKQN7KjYtiTy0xPe3Kaj+iV31sWFRGS6rMfhFKO/KB1x141HXgNSJIkZ/MeZctX/AQnyjyJUk1BCb2Qnx0=
X-Received: by 2002:a17:90b:4b8e:b0:2a1:fa61:c36f with SMTP id
 lr14-20020a17090b4b8e00b002a1fa61c36fmr2296315pjb.6.1711617272743; Thu, 28
 Mar 2024 02:14:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240324150107.976025-1-hpa@redhat.com> <20240324150107.976025-2-hpa@redhat.com>
 <CAHp75Ve5201KNdjvDZYq_unHTKp9wZXPWZXDgStP8y+XjtnWWg@mail.gmail.com>
 <CAEth8oG7_qFuUrL+kX3ezNatWqKPqT-qiaO5NGY-N3F3ufQL9w@mail.gmail.com> <CAHp75VdQtmT0G1dFhdY7TrcBj2W6GhOaVv90_T1e3MdEtiduQQ@mail.gmail.com>
In-Reply-To: <CAHp75VdQtmT0G1dFhdY7TrcBj2W6GhOaVv90_T1e3MdEtiduQQ@mail.gmail.com>
From: Kate Hsuan <hpa@redhat.com>
Date: Thu, 28 Mar 2024 17:14:21 +0800
Message-ID: <CAEth8oH9iDm1fN1LyPRtvHt=w7z72kunpRssxg3-nPNAgOyoXg@mail.gmail.com>
Subject: Re: [PATCH v5 RESEND 1/6] platform: x86-android-tablets: other: Add
 swnode for Xiaomi pad2 indicator LED
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	=?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
	linux-kernel@vger.kernel.org, Sebastian Reichel <sre@kernel.org>, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 27, 2024 at 7:06=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Wed, Mar 27, 2024 at 9:58=E2=80=AFAM Kate Hsuan <hpa@redhat.com> wrote=
:
> > On Mon, Mar 25, 2024 at 3:30=E2=80=AFAM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > On Sun, Mar 24, 2024 at 5:02=E2=80=AFPM Kate Hsuan <hpa@redhat.com> w=
rote:
>
> ...
>
> > > > +/* main fwnode for ktd2026 */
> > > > +static const struct software_node ktd2026_node =3D {
> > > > +       .name =3D "ktd2026"
> > >
> > > Leave a comma, this is not a terminator.
> > >
> > > > +};
> > >
> > > When I asked about the name I relied on the fact that you have an ide=
a
> > > how it works. So, assuming my understanding is correct, this platform
> > > may not have more than a single LED of this type. Dunno if we need a
> > > comment about this.
> >
> > I'll make a comment to describe the configuration.
> > This LED controller can be configured to an RGB LED like this. Also,
> > it can be configured as three single-color (RGB) LEDs to show red,
> > green, and blue only.
> > I think the name can be "ktd2026-multi-color". Is it good for you?
>
> My point here is that the name is static and if you have more than one
> LED in the system, the second one won't be registered due to sysfs
> name collisions. Question here is how many of these types of LEDs are
> possible on the platform? If more than one, the name has to be
> dropped. Writing this I think a comment would be good to have in any
> case.

Only one RGB LED controller on this platform so we can name it. I also
tested the LED with and without the name and the LED worked properly.
I think the name can be dropped and put a comment there to describe
the usage and configuration of the LED controller.

Thank you :)
>
> ...
>
> > > > +static int __init xiaomi_mipad2_init(void)
> > > > +{
> > > > +       return software_node_register_node_group(ktd2026_node_group=
);
> > > > +}
> > > > +
> > > > +static void xiaomi_mipad2_exit(void)
> > >
> > > __exit ?
> > No need.
> > x86-andriod-tablet is based on platform_driver and platform_device so
> > it doesn't need __exit.
> >
> > I put __exit and the compiler complained about the warning.
> > =3D=3D=3D
> > WARNING: modpost:
> > drivers/platform/x86/x86-android-tablets/x86-android-tablets: section
> > mismatch in reference: xiaomi_mipad2_info+0x50 (section: .init.rodata)
> > -> xiaomi_mipad2_exit (section: .exit.text)
> > =3D=3D=3D
>
> This is interesting. Why then do we call them symmetrically?
>
> Hans, do we need to have anything here been amended?
>
> --
> With Best Regards,
> Andy Shevchenko
>


--=20
BR,
Kate


