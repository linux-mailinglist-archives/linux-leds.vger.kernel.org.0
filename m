Return-Path: <linux-leds+bounces-137-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 240D27F77D8
	for <lists+linux-leds@lfdr.de>; Fri, 24 Nov 2023 16:30:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E530DB21491
	for <lists+linux-leds@lfdr.de>; Fri, 24 Nov 2023 15:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74EA92E823;
	Fri, 24 Nov 2023 15:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hXKfKyEi"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F3BF10FB;
	Fri, 24 Nov 2023 07:30:38 -0800 (PST)
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-6ce2ea3a944so1269113a34.1;
        Fri, 24 Nov 2023 07:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700839838; x=1701444638; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p615f7LAIDV1MfWlNjaOHn4LpR2INIwWiYXMET+eRR0=;
        b=hXKfKyEizlFZH90FF9IkLunFP/+IZ3ExtXyh7N7B+FMT4/Z1u33RKupAa1z2Aszuf+
         aLhHkHzospwwZdrEJf/oCovPTmTBloKJE2pAroPi9jwzk2auJHMypFOSyis1Xy+6tgYi
         qmOXkZ32rjwNDCOqJ3Ex8FiH2tFMF5URhM+snyljDiXP1lXLhVue822wHOH8U/3qPH18
         86qAGsA8hAt140Tumj2u+hzo7zSOCETY43D7esN+N+Bce+p2ZxFCbWPctWRRjiO+n4oK
         LWcvby2SCUeULytxMxRneIW3PtpttPVXcnvSyaFA7harB1vJC2vfGz+ZpsKVVbbeCHrm
         H2Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700839838; x=1701444638;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p615f7LAIDV1MfWlNjaOHn4LpR2INIwWiYXMET+eRR0=;
        b=pioZi2etcFPCZbVfrsDgPNl6XAPXFslt1BDFswoTsk+G728WfAJ+wwzKCR0uNDvzA/
         /4YQOB8Cjan06rMGmAlzFkVC7ZdfBl1RDNgzy9nO/R4nO/uVLSpUt4St2wK4GfFSOPBZ
         8JInZ+yoBgBOtbTXveBQ0VuRg6BAGJAiO1Yga2mQ1HPH0aT+i6olJwaVpb6vcnLwZIf7
         lZo3eCJCJ8XOW4/TWgtckH3hy+TVbANypmL3hcUen6DyrzxflrFBDfAYULjD7VB9FbXZ
         +Ig9uTGIxTymt4mdWL04HNNXwe+UMEEpOZp9JvNhVzMQeQXMxT/nEmJypAHx6KfbwF9c
         b6zw==
X-Gm-Message-State: AOJu0YzCIYINCrWNnf43oufaoGqTGTo3CEBYIWT1iUM4GJGuOVZ9GgoD
	Vdg8AIrDtttG6jzEzUQIO7m5PY/M5NCDkpJXbvY=
X-Google-Smtp-Source: AGHT+IFpl1LhfXbivJZHjzdRTqOJQ24OGD0LYHzdPZE88GRJFvGGbVZxiUVjs6DZh16KaOvIRQpWMJvuXmwQO/NLcOI=
X-Received: by 2002:a05:6830:45:b0:6c4:cdce:5de8 with SMTP id
 d5-20020a056830004500b006c4cdce5de8mr3506711otp.26.1700839837786; Fri, 24 Nov
 2023 07:30:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231025130737.2015468-1-gnstark@salutedevices.com> <8704539b-ed3b-44e6-aa82-586e2f895e2b@salutedevices.com>
In-Reply-To: <8704539b-ed3b-44e6-aa82-586e2f895e2b@salutedevices.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 24 Nov 2023 17:30:01 +0200
Message-ID: <CAHp75VcF3Y1MwJPY7jk274b3UWe7KWGFTYCppjC5fu7Ppf5XDQ@mail.gmail.com>
Subject: Re: [PATCH 0/8] devm_led_classdev_register() usage problem
To: George Stark <gnstark@salutedevices.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kernel@sberdevices.ru, pavel@ucw.cz, 
	lee@kernel.org, vadimp@nvidia.com, npiggin@gmail.com, 
	christophe.leroy@csgroup.eu, mpe@ellerman.id.au
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 4, 2023 at 9:17=E2=80=AFAM George Stark <gnstark@salutedevices.=
com> wrote:
>
> Hello Andy
>
> Could you please take a look at this patch series?
>
> I've just found your post on habr about devres API misusing and I think
> this is just another case.

Just had a look, sorry for the delay.
By quickly reading it seems to be a wrong approach (or wrong end to
start solving the issue from).

--=20
With Best Regards,
Andy Shevchenko

