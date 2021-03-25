Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3D54348DD4
	for <lists+linux-leds@lfdr.de>; Thu, 25 Mar 2021 11:19:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229934AbhCYKTV (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 25 Mar 2021 06:19:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229847AbhCYKTR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 25 Mar 2021 06:19:17 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE994C06174A;
        Thu, 25 Mar 2021 03:19:16 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id u4so2398948ljo.6;
        Thu, 25 Mar 2021 03:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=dXFiNAmmBesTKt1kaQDc049bmW8fXL2vJKahfURMQQc=;
        b=LM17N+65apGl0Gwobb+yb+lQMpgXm9Qf3oVQGmz5nbzRMjqgYSksXHoMESb4T2Dfh+
         COj7BdtQxfeMpljdj0CQBihpWd8aNiZx2psPvY2nynrg9Q9TmLldzZVJNcNRHlrWdR7i
         SgrpQaCgWNLuJbq06GxO1bVqIVP9s+nPfVc6TsMlyho3WRVSruDR9T8QAxXS7Kp2nuMq
         /LlKoEENQNH2/M/VaEJTv4t584hmE+Ws+FEt1IEZtaWL6g1JuYkfkBQp4cV5HPYc6pfn
         Kb+22xWej7hywb+EEow7leHgQrZF8rpmb3DFbciPdOv0NZeAo2vAOgzsP9zTW99ypPs/
         Yk9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=dXFiNAmmBesTKt1kaQDc049bmW8fXL2vJKahfURMQQc=;
        b=dKD1phqwcNoBShn3xp11o4Fbqs+WyEyzNVCcLt8EvNG+h2UKohq3ge/G36Air8I2ZZ
         KirS7ol3UVG1dlIUwkuZmIGlPwvK8DI1NFDJl5hvcjCnXFTTAm7NnZw4pPmTiUJM/594
         PwLWdMuS6GxTv3pcOXj+Aotkb7KPs//IRtZeJ3kpMR5UPAChDYY8jdE7IK7TmngQXo7U
         Gy+/BokZTM3ES933jR90C2m35FDPiLwYdOT9w5uPkSWAWGoka3yLzIhbO0WUgTVIlCDS
         GIAcbR+MogFDqYXz6fG4lwyQl9NGKi30IlTyj1+YjXicLgi68yygfZXLHoEzykcytxuc
         V8og==
X-Gm-Message-State: AOAM532GvuVHaOHbG3HpM1t7kQICPZf/baeoAOhwo7gmHzLDnazdCKZ6
        2F093U9FyVfOaiedDr5z4xNAM7iKqc1KOHvI8MQ=
X-Google-Smtp-Source: ABdhPJz0DLjktFfVkiFjRwlEvNDVJ6oNlmBkBftZ4UBWppOTcXi3j2/DioJENx4ueefyS5nnOKbiQ3wkHpf3f8x10Ew=
X-Received: by 2002:a2e:bc25:: with SMTP id b37mr5144021ljf.342.1616667555360;
 Thu, 25 Mar 2021 03:19:15 -0700 (PDT)
MIME-Version: 1.0
References: <1604284946-16254-1-git-send-email-u0084500@gmail.com>
 <3cf3ee50-3dd8-d3b1-66a9-cea2ba487de3@gmail.com> <CADiBU3-pDdoCioKc1mZwx7tp+_kfcN=4j-iMOT9LupXW03qwNA@mail.gmail.com>
 <20210325100122.GA4619@amd>
In-Reply-To: <20210325100122.GA4619@amd>
From:   ChiYuan Huang <u0084500@gmail.com>
Date:   Thu, 25 Mar 2021 18:19:03 +0800
Message-ID: <CADiBU3-J7nUav98t=inpt-UzkLkARtJBRgO8q5GXFX4wRoWmgw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] leds: rt4505: Add support for Richtek RT4505 flash
 LED controller
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        cy_huang <cy_huang@richtek.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel Machek <pavel@ucw.cz> =E6=96=BC 2021=E5=B9=B43=E6=9C=8825=E6=97=A5 =
=E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=886:01=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi!
>
> > > >   create mode 100644 drivers/leds/flash/Kconfig
> > > >   create mode 100644 drivers/leds/flash/Makefile
> > > >   create mode 100644 drivers/leds/flash/leds-rt4505.c
> > >
> > > Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> > >
> > Any problem with this patch? Do I need to submit it again?
>
> It won't apply on current next.
>
> So please: Merge ACKs, reorder it so that docs goes first, port it to
>
> To gitolite.kernel.org:pub/scm/linux/kernel/git/pavel/linux-leds.git
>    34731ed13e8a..85674b0e40d9  for-next -> for-next
>
> and resubmit.

Thx. It's clear.
So the next I need to do is
1. Merge ACKs
2. Reorder this patch from the docs first

After done, do I need to change the patch revision from v2 to v3
before submitng it?
>
> Thanks you,
>                                                                 Pavel
> --
> http://www.livejournal.com/~pavelmachek
