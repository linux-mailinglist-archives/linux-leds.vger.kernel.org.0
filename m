Return-Path: <linux-leds+bounces-1499-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EE08A93AA
	for <lists+linux-leds@lfdr.de>; Thu, 18 Apr 2024 09:01:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEE3D1F2364E
	for <lists+linux-leds@lfdr.de>; Thu, 18 Apr 2024 07:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 651ED37719;
	Thu, 18 Apr 2024 07:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DiAZHUmr"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C077738FB9
	for <linux-leds@vger.kernel.org>; Thu, 18 Apr 2024 07:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713423692; cv=none; b=TJpskm07bG2CzT6MyVSqZezFeD0sYY1B+y0ePteXpHPwYq9v4tgk+OyufqFdp4i0WNEVGBbmK2BCoyQlF153zqTQs7CitHg01A00Lw+WeCP0Nv42TTF4bNuSrJfk8Wkc7OOuLcv9EaQ8R5J00B1V+Mai7D/rYEUloP5dQXhiYIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713423692; c=relaxed/simple;
	bh=aBa+Zd4DOsCV5bBQi56SDbzPnQQrs8wGfyaz6qAplIg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dA4SbfgV2uQDucndq1zZKcWYzalnfu6VPhNiTAYvE18sbh6ORd0ibspBQIG25kax++Mbq49XhwVS4b7R/+wNZtEVHanPgCuG+oLtnSf4fZgbMkDEXWSZYo7z/WF0xy5NWPmi9iC4kD7tJRZM9CxPmcEtWOVLP2WoxVlfxvdGwaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DiAZHUmr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713423687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DCeGODggKk984bbqSwADAeFH8dPaC8yv8N2n7Vqmn3A=;
	b=DiAZHUmrk/1zUMGjtJrVdbprN3QW+iaH+DxXUD57AShJD3q6Yyr3XxxTqdQGrMy2g5jo+e
	8PepwI1YZEavf5ZA13XfoWbja7vhI/EdVHqJIpywqa9Bz9jl/pNQKKIrLqHLCkfB1RCKPV
	Q2m4MDN0XRhZxG/Fd0wSFVEW1JgjJ3U=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-176-D7GMrOy9OfCB_jAxANQDww-1; Thu, 18 Apr 2024 03:01:26 -0400
X-MC-Unique: D7GMrOy9OfCB_jAxANQDww-1
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-6ecea48eb37so829698b3a.1
        for <linux-leds@vger.kernel.org>; Thu, 18 Apr 2024 00:01:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713423685; x=1714028485;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DCeGODggKk984bbqSwADAeFH8dPaC8yv8N2n7Vqmn3A=;
        b=M7YBVDtV+C76q8kGPKTsJ5Qq1anFg4Pr3dFjm7JSa164Qy40qmeDIf3r6oIL+Fpcau
         +ugoe6+KU19wYgTclLvLxsYBgvN8oO0HbOAqMAKxZyJ0UPJ1wgnrvkP6a+QgkpS3jpsT
         Hs0kOL0SYycVa9VGTsit22R3jZTH+wjepIyZMRAlwlJw9gWDTtEiA7tDeXnOkWJvGItd
         QLrq0GllKUkMzRurBNf3svHWWNR4rfCrmPYLxMgYksmIlCtEtcMQTEvHx0nJrf+LAo2h
         4Ukb1Qgy4OP5OLbTq7wv06BcZUK0AR5eJx+cBwN8xikQjKIilS1cxK+YsBJAZrVWSKX5
         yzlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxP8ZUE1UkEzTU4TExrpeo4hrpGU6hyY/hW4ykK65dtSzolE5z5N89z+WjnK9Fwd2qjHscP447NQca3w031dgdvsaomkb/tHnOnw==
X-Gm-Message-State: AOJu0Yy/72luKvoUTGDx7SR/4wtE+E37XkIWfjhh9XeuYTCMiPXOvZqB
	3+1kUo2YuuRBL0SG393oPT3IwKBSl2lJljMnmmprs6D7vJuHR+wLZR9EVQ6jTMb8ypN5hxvOCad
	DLmcPuf2Y18Ufif/XHLanNIh0WTkS+KxWDlDyBbx2h3Cn+wI6fG9ZoAqL6TcMka0L7pz6vB0QIn
	ZC12CHpPOBg5LehMFeLFa5c02UdQXwUtGZMQ==
X-Received: by 2002:a05:6a20:1588:b0:1aa:5984:d3 with SMTP id h8-20020a056a20158800b001aa598400d3mr2813389pzj.6.1713423685038;
        Thu, 18 Apr 2024 00:01:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9LpK02ULWJ6ZvpKG3pyD3OiboVfLCBcf9kyYEbDUPg0rA+sYUJZ9rBRQ1cKRvIYIB81qkbkXpr0XQAKD8VfU=
X-Received: by 2002:a05:6a20:1588:b0:1aa:5984:d3 with SMTP id
 h8-20020a056a20158800b001aa598400d3mr2813354pzj.6.1713423684648; Thu, 18 Apr
 2024 00:01:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240416053909.256319-1-hpa@redhat.com> <20240416053909.256319-4-hpa@redhat.com>
 <CAHp75VdRgBqaX4NNvABS-90O34OtRf5t85JOjpG=tOw2SHr_tw@mail.gmail.com>
In-Reply-To: <CAHp75VdRgBqaX4NNvABS-90O34OtRf5t85JOjpG=tOw2SHr_tw@mail.gmail.com>
From: Kate Hsuan <hpa@redhat.com>
Date: Thu, 18 Apr 2024 15:01:13 +0800
Message-ID: <CAEth8oEtb+m_2DKF6Z5W1m1fbBxnP_dgS1tNS9iJMUgg4ZRhnw@mail.gmail.com>
Subject: Re: [PATCH v6 3/5] leds: rgb: leds-ktd202x: I2C ID tables for KTD2026
 and 2027
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	=?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
	linux-kernel@vger.kernel.org, Sebastian Reichel <sre@kernel.org>, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy

On Wed, Apr 17, 2024 at 1:32=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Apr 16, 2024 at 8:40=E2=80=AFAM Kate Hsuan <hpa@redhat.com> wrote=
:
> >
> > This table shows the maximum support LED channel for KTD2026 and KTD-20=
27.
> > The 3-channel LED controller KTD2026 controls R/G/B three LEDs. The
> > 4-channel LED controller KTD2027 controls R/G/B and a flashing LEDs.
>
> and flashing

LEDs should be LED.

>
> ...
>
> > Link: https://www.kinet-ic.com/uploads/KTD2026-7-04h.pdf
>
> Make it Datasheet: tag
Okay
>
> >
>
> and drop this blank line (to ensure the Datasheet will be recognised as a=
 tag).
Okay
>
> > Signed-off-by: Kate Hsuan <hpa@redhat.com>
>
> ...
>
> > -       .shutdown =3D ktd202x_shutdown
> > +       .shutdown =3D ktd202x_shutdown,
> > +       .id_table =3D ktd202x_id
>
> Exactly good example to show what the difference is between
> "terminator entry" and "last field in the initialiser" and why in the
> latter it's better to keep a trailing comma. And hence why the stray
> change in the previous patch. So, id_table also should keep a trailing
> comma.

Thank you for reviewing it.
Lesson learned. Now I know how to manipulate the comma correctly.

>
> --
> With Best Regards,
> Andy Shevchenko
>


--=20
BR,
Kate


