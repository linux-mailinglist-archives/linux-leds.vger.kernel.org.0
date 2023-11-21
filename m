Return-Path: <linux-leds+bounces-68-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A777F330D
	for <lists+linux-leds@lfdr.de>; Tue, 21 Nov 2023 17:01:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 65FADB21E6A
	for <lists+linux-leds@lfdr.de>; Tue, 21 Nov 2023 16:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CFC359149;
	Tue, 21 Nov 2023 16:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="F3kLBalV"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1775197
	for <linux-leds@vger.kernel.org>; Tue, 21 Nov 2023 08:01:48 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1cc5fa0e4d5so48334385ad.0
        for <linux-leds@vger.kernel.org>; Tue, 21 Nov 2023 08:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1700582508; x=1701187308; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=94uiKCc8mVHzfD5hMHo+ipsMG0R6MKAPs1S03wUwkTY=;
        b=F3kLBalVg0ZTxwyzHv2jZBM3n0dBSB+bkjtFCFupnk+2GBG8uvUvZV38H+Z0lbA9P4
         VW04jdNhDTtd2P8J9U87vB8841OxMNv+PUYed2oOfItJqQ2yUWZWmH3yLyY984YvsUZ4
         rCdzFc/4CoI6ZdhUjJBQPoVJWtJb2JRcog57MhdSUgAeiK+dsXUUWju7cG/F/1uXUz6s
         d7CKHHjb+fCbBDmcAqnK/uy/d/rYNGKDhLzzvD+davd/PiJC27rzAbnT2NwRzWR94i6h
         /v6lUOscYWVzWG5HYYNcgNlAB/6nEKcWSP5NVnf0pwa8U48Op3AsYJPdyal+F+GNSphm
         CLCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700582508; x=1701187308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=94uiKCc8mVHzfD5hMHo+ipsMG0R6MKAPs1S03wUwkTY=;
        b=fbFgJf7YBjXKqiU21RaajUFx4mmSTUaDHMJRqbTvAK8XjNGDURpfETiPZENG3nbzwa
         SVhVVWPku3O6xE8w5sCpDsr9nBxlGUiXW4KFMGZXRWo8tL3O+eghSGI/hcjLtkdJVOb/
         jARlO7Ms4CSP8eRsIfBaDmZMQn8OYbk8vJQGb6llZIDMG00ZnEKREMrAxZ6ojqAxKcQN
         NJU6r+mo5/ZE36o8AR5eRhDaASOqE2YhHdhQiV6/9tUXy08xq76bmJe1cozQOa/ANjoW
         yTVxVt5oJm/m339zz+/0oLGwJhJs/98H2BuM3hHhWi/Tt2w024yQ8opv3ac/Zt2CkcFZ
         ClVQ==
X-Gm-Message-State: AOJu0YwuBHWoX/w82VCkJhWQtHQpx5hG3mYKDFFzAKb3Lisg1V4Uw4DL
	o4Dw78dubu78Jn/tKsxMw0cU1BpdEsA+tmElBBBBcq1x9PFaXrem7uSOFA==
X-Google-Smtp-Source: AGHT+IFr6SofnB98KDklqVgcIdirU+mIhOxh+1ZfP/9TavcPxVQ3b7d+I75tL/HOikpoDFRayVr+Lz2I1ZPSTX8a/Bs=
X-Received: by 2002:a17:902:e5ca:b0:1cf:6373:b8a5 with SMTP id
 u10-20020a170902e5ca00b001cf6373b8a5mr6074879plf.25.1700582508194; Tue, 21
 Nov 2023 08:01:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230914114521.1491390-1-naresh.solanki@9elements.com>
 <20230920130528.GG13143@google.com> <CABqG17j_gCr8xw65qjn4Kh7ChdraZbLsyGOsCmFEEWG3txjE4A@mail.gmail.com>
 <20230921103156.GB3449785@google.com> <CABqG17ibzHiYmzCZ6ZpAa8BZhj5N+0dQ0aa1yebtCk0YYVdsFQ@mail.gmail.com>
 <CABqG17h8hxgmMA=G5hitzgjNSX_BZ2utFsMZni9evn0Nogu0GA@mail.gmail.com>
 <20231117121531.GC137434@google.com> <CABqG17hPnx465dRKdMdSd2s38_T6DQFn5hsx1SL0RtA+r4JFZQ@mail.gmail.com>
 <20231121153302.GD173820@google.com>
In-Reply-To: <20231121153302.GD173820@google.com>
From: Naresh Solanki <naresh.solanki@9elements.com>
Date: Tue, 21 Nov 2023 21:31:37 +0530
Message-ID: <CABqG17hufcNS5-wLEEpZniSE2MAfEeN9Ljhs5MPGeu-2xZP+HQ@mail.gmail.com>
Subject: Re: [RESEND PATCH v3] leds: max5970: Add support for max5970
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, Patrick Rudolph <patrick.rudolph@9elements.com>, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lee,

Thank you for your insights. I appreciate your guidance on the matter.
Yes will rewrite the change as below:

        regmap =3D dev_get_regmap(pdev->dev.parent, NULL);
        if (!regmap)
                return -ENODEV;

I believe this modification aligns with your suggestion. Please let me
know if this meets the requirements or if you have any further
suggestions or adjustments

Regards,
Naresh


On Tue, 21 Nov 2023 at 21:03, Lee Jones <lee@kernel.org> wrote:
>
> On Mon, 20 Nov 2023, Naresh Solanki wrote:
>
> > Hi
> >
> > On Fri, 17 Nov 2023 at 17:45, Lee Jones <lee@kernel.org> wrote:
> > >
> > > On Thu, 09 Nov 2023, Naresh Solanki wrote:
> > >
> > > > Hey Lee,
> > > >
> > > > Is there anything specific you'd suggest changing in the current
> > > > patchset, or are we good to proceed?
> > >
> > > What do you mean by proceed?
> > >
> > > You are good to make changes and submit a subsequent version.
> > >
> > > Not entirely sure what you're asking.
> >
> > As a follow up on previous discussion regarding use of DEFER on probe
> > if regmap isn't initialized, the implementation was based on other simi=
lar
> > drivers & hence it was retained although its not needed due to dependen=
cies.
> >
> > I'm not entirely sure to keep the regmap check or make another
> > patch revision with regmap check removed ?
>
> You tell me.
>
> You should understand the device you're attempting to support along with
> the code you're authoring and its subsequent implications.  If you don't
> know what a section of code does or whether/why it's required, why did
> you write it?
>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]

