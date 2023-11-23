Return-Path: <linux-leds+bounces-109-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7949B7F5FD9
	for <lists+linux-leds@lfdr.de>; Thu, 23 Nov 2023 14:14:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2FD8B1F20F05
	for <lists+linux-leds@lfdr.de>; Thu, 23 Nov 2023 13:14:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9809824B31;
	Thu, 23 Nov 2023 13:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="P+tsbNqj"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A25A41BF
	for <linux-leds@vger.kernel.org>; Thu, 23 Nov 2023 05:14:37 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2809b4d648bso731919a91.2
        for <linux-leds@vger.kernel.org>; Thu, 23 Nov 2023 05:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1700745277; x=1701350077; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fv8GZerhhui6fIHfOSZEUfr0KlTYNPj6B+LleuIkHfQ=;
        b=P+tsbNqj9G+Fug1Zx4EIV+b5TLy2T+ZBhD0N/inYzwRjlymadxTYDbADdcTpGHllpa
         fw1gZ3Lf54PeglSyVI0B3z9xEhfCxGMimHQxZ0yJBHu8eQw1c02EjRyRYEQvbflZ+2Ij
         /+7aOd7UlWnEUg0sMSEmOUovx08x0mF0Wo9V43ekLQRYjofKau578vmGcYuMuz7HKg47
         YM3pg5AHNRJLqbxDPc5Pr8g5QaQL03CSLWB2PfdAlZ4glMiIQrrgHGUXElmVzrkywCSk
         3Ynw4aX2zb/oCTzfRuPDYusb3pU+i1/YV2/xOwARIeKBZ+JSi1wQLF4oYBYnZWBtqfrr
         EGxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700745277; x=1701350077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fv8GZerhhui6fIHfOSZEUfr0KlTYNPj6B+LleuIkHfQ=;
        b=VPe09m8CDLe/YrPQ05DnaMnosAwBI3/04721IuCcYqKksjC5MbW0CPNcihksn3m9zM
         ugn/rFtdiZVhQMBH1dHfys+nFgYVDNlGgtaDP0zkuzz9oHwrXra0D0KClrZPgi07RBi6
         gUk+qpomoUNfox0+fGC9PA99XC61Dsz7OZFT5VErh0+n+/F4g9kDgBGjehbkqBCkgd78
         da20aixrE3S2fkEh83HHjC+lCDpObF2LqsdRb9phy7dKfVxMNDZfCQ/UPeTfrSIg4GVh
         2+McHttxLkTOv2nCb2XlpMi+IRfZRjDqPlSAke9v/H1AKJGFhUQMLE0dbSDCaEs06HA7
         s/9A==
X-Gm-Message-State: AOJu0YyAdnqJ7l58ZWvn3Eolj6bVMiAwn+R9F7WK7u9oa4kNiP585CNg
	vrc4QrZcd9tGW7bZzw9l5zYUL7d4RYsznMacs4G+VQ==
X-Google-Smtp-Source: AGHT+IGpE8kpg4pZ6H9Fs4mTmjCY2nQNpRMeWwwwdgt3zz5RX07UlhDN5Hn4jS3hCeq2/goNhLXQJ8vVXXqliOC5MiE=
X-Received: by 2002:a17:90a:ab02:b0:285:6f1a:4a71 with SMTP id
 m2-20020a17090aab0200b002856f1a4a71mr985917pjq.32.1700745276789; Thu, 23 Nov
 2023 05:14:36 -0800 (PST)
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
 <20231121153302.GD173820@google.com> <CABqG17hufcNS5-wLEEpZniSE2MAfEeN9Ljhs5MPGeu-2xZP+HQ@mail.gmail.com>
 <20231122114958.GJ173820@google.com>
In-Reply-To: <20231122114958.GJ173820@google.com>
From: Naresh Solanki <naresh.solanki@9elements.com>
Date: Thu, 23 Nov 2023 18:44:26 +0530
Message-ID: <CABqG17ifCpaAYuGbEJm-rS1ojSA+a1iw+EZ=teYyb0apEkVtuw@mail.gmail.com>
Subject: Re: [RESEND PATCH v3] leds: max5970: Add support for max5970
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, Patrick Rudolph <patrick.rudolph@9elements.com>, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lee

On Wed, 22 Nov 2023 at 17:20, Lee Jones <lee@kernel.org> wrote:
>
> Please read this:
>
>   https://subspace.kernel.org/etiquette.html#do-not-top-post-when-replyin=
g
Ack
>
> On Tue, 21 Nov 2023, Naresh Solanki wrote:
>
> > Hi Lee,
> >
> > Thank you for your insights. I appreciate your guidance on the matter.
> > Yes will rewrite the change as below:
> >
> >         regmap =3D dev_get_regmap(pdev->dev.parent, NULL);
> >         if (!regmap)
> >                 return -ENODEV;
> >
> > I believe this modification aligns with your suggestion. Please let me
> > know if this meets the requirements or if you have any further
> > suggestions or adjustments
>
> Please submit the next revision.
Ack

Regards,
Naresh
>
> > On Tue, 21 Nov 2023 at 21:03, Lee Jones <lee@kernel.org> wrote:
> > >
> > > On Mon, 20 Nov 2023, Naresh Solanki wrote:
> > >
> > > > Hi
> > > >
> > > > On Fri, 17 Nov 2023 at 17:45, Lee Jones <lee@kernel.org> wrote:
> > > > >
> > > > > On Thu, 09 Nov 2023, Naresh Solanki wrote:
> > > > >
> > > > > > Hey Lee,
> > > > > >
> > > > > > Is there anything specific you'd suggest changing in the curren=
t
> > > > > > patchset, or are we good to proceed?
> > > > >
> > > > > What do you mean by proceed?
> > > > >
> > > > > You are good to make changes and submit a subsequent version.
> > > > >
> > > > > Not entirely sure what you're asking.
> > > >
> > > > As a follow up on previous discussion regarding use of DEFER on pro=
be
> > > > if regmap isn't initialized, the implementation was based on other =
similar
> > > > drivers & hence it was retained although its not needed due to depe=
ndencies.
> > > >
> > > > I'm not entirely sure to keep the regmap check or make another
> > > > patch revision with regmap check removed ?
> > >
> > > You tell me.
> > >
> > > You should understand the device you're attempting to support along w=
ith
> > > the code you're authoring and its subsequent implications.  If you do=
n't
> > > know what a section of code does or whether/why it's required, why di=
d
> > > you write it?
> > >
> > > --
> > > Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]

