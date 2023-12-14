Return-Path: <linux-leds+bounces-400-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7818131E1
	for <lists+linux-leds@lfdr.de>; Thu, 14 Dec 2023 14:43:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9CEB1F21A68
	for <lists+linux-leds@lfdr.de>; Thu, 14 Dec 2023 13:43:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B13BD56B61;
	Thu, 14 Dec 2023 13:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KrCEpFTi"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0353D11B;
	Thu, 14 Dec 2023 05:43:00 -0800 (PST)
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-425b9acaf80so41626121cf.1;
        Thu, 14 Dec 2023 05:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702561379; x=1703166179; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4F5f95LcvN3I9tb1o2cf6Anqpz0ggkd9L4sVElAB9xQ=;
        b=KrCEpFTirDHHeMuBW/hvVYpL3MegdF7916PQVQwFiYWlNFBiE9yzKXmI20eSpV+JQ8
         YLuKQ3tkM7lf9NWUrtgH07XGx5EnP5dqXgXTXuVIn30dmV6xazGkyYY5NVrBEmyqe5OL
         FavGdZJ3qayhpgnW/sfHRA7JWYfGSrPtHT/9dHAra6B/v0j5elLVjmda0s2bCjkfKwuJ
         AT1rR3h8POC/YsIHFyMbZAsi9TalhZYiJU43UcHU9XD+GIjO7MJWPjotgC20XypC9mpg
         8zb7V3wHrerrhQjsSL7Wpn2j1PEq25zlKfFhdLCZZQiKnQuVXSF9elfgq0nJ2LMfny6V
         DTQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702561379; x=1703166179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4F5f95LcvN3I9tb1o2cf6Anqpz0ggkd9L4sVElAB9xQ=;
        b=RIZSGe8E1T9FkREROrS+xB/FILQrIDzR7ubRtq3iBAahtORsgL9Z1/EjmVLtFO7kvG
         iqMI5rCNJtT2p5nWbpZjjYmaoyGz0dIa6+gChvFPvERFuzrdQyic9+7QEoXKbgCwKxlZ
         FqtYXYYtDVR5rl3IJ3nwMUb4V7tHVpQmfmE+iOQjYjOlzen876dLrsS6UF1xHuGNyWVc
         Ng9qwD1sOfX9Ngb49y74dWELY30G69EZYBFct+9L8fN0GxmDTm6EUw1pblZAGp1MzAHD
         UkxjI2Xu9HtXY+RDBmKou8sg/xGZAQsisBNKewmr8VMQqRIekEr5ah+uTZeDCpShRPEP
         nMBA==
X-Gm-Message-State: AOJu0YwMHJUWJtjeeWtV17faZlCAQbVzosCclxrbuuMgzj5aLaoqjiIJ
	LzATg6CnwN6yhEu1wvcWDVt73G6aUoJ3E2nyb0XlnWguedg=
X-Google-Smtp-Source: AGHT+IG00DW8WGswWCLm8yY3QQCwaCYiYaSFZPez3AXd/Nc0ny4e8JjzlOJQZ461VPjmiEA7j5c6AF2J23iRG5qr0YA=
X-Received: by 2002:a05:622a:148f:b0:425:4043:1897 with SMTP id
 t15-20020a05622a148f00b0042540431897mr13407370qtx.74.1702561378940; Thu, 14
 Dec 2023 05:42:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231213223020.2713164-1-gnstark@salutedevices.com>
 <20231213223020.2713164-4-gnstark@salutedevices.com> <80881d5d-3ae9-4580-84c1-f25b421cc518@csgroup.eu>
 <99882775-af52-49ea-b17d-f3d1f23f8bbe@salutedevices.com> <717727a1-6a99-43ff-b032-b7a20542cca8@csgroup.eu>
In-Reply-To: <717727a1-6a99-43ff-b032-b7a20542cca8@csgroup.eu>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 14 Dec 2023 15:42:22 +0200
Message-ID: <CAHp75VdLT9cOuKn-d14Dp5Ve2NBXAdHQZWeXTLLjYxCQZZQtEw@mail.gmail.com>
Subject: Re: [PATCH v3 03/11] devm-helpers: introduce devm_mutex_init
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: George Stark <gnstark@salutedevices.com>, "pavel@ucw.cz" <pavel@ucw.cz>, 
	"lee@kernel.org" <lee@kernel.org>, "vadimp@nvidia.com" <vadimp@nvidia.com>, 
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>, "npiggin@gmail.com" <npiggin@gmail.com>, 
	"hdegoede@redhat.com" <hdegoede@redhat.com>, "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>, 
	"peterz@infradead.org" <peterz@infradead.org>, "mingo@redhat.com" <mingo@redhat.com>, 
	"will@kernel.org" <will@kernel.org>, "longman@redhat.com" <longman@redhat.com>, 
	"boqun.feng@gmail.com" <boqun.feng@gmail.com>, "nikitos.tr@gmail.com" <nikitos.tr@gmail.com>, 
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, 
	"kernel@salutedevices.com" <kernel@salutedevices.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 14, 2023 at 3:00=E2=80=AFPM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
> Le 14/12/2023 =C3=A0 13:48, George Stark a =C3=A9crit :
> > [Vous ne recevez pas souvent de courriers de gnstark@salutedevices.com.
> > D=C3=A9couvrez pourquoi ceci est important =C3=A0
> > https://aka.ms/LearnAboutSenderIdentification ]
> > On 12/14/23 13:06, Christophe Leroy wrote:

...

> >> So you abandonned the idea of using mutex.h ?
> >
> > I'm not the one who make a choice here. The patch [1] you're talking
> > about was seen by everyone but it seems like no one had shown interest.
> > For me personally approach with #define mutex_destroy is not very usual
> > but if even slight mixing device with mutex.h is unacceptable what else
> > can we do? Avoiding the need to allocate devm slot for empty
> > mutex_destroy is more important.
> >
>
> Why would a forward declaration of struct device in mutex.h be
> unacceptable when it is done in so many headers ?
>
> $ git grep "struct device;" include/ | wc -l
> 164

I believe the main misunderstanding here is where to put the
implementation. AFAIU Christophe wants the implementation to be in the
very same _C_-file where mutex_destroy() is defined. mutex.h in this
case indeed requires the only forward declaration and hence doesn't
need to include device.h.

--=20
With Best Regards,
Andy Shevchenko

