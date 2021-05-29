Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBC36394B64
	for <lists+linux-leds@lfdr.de>; Sat, 29 May 2021 11:42:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229560AbhE2Jo0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 29 May 2021 05:44:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229559AbhE2Jo0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 29 May 2021 05:44:26 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52432C061574;
        Sat, 29 May 2021 02:42:50 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id d20so2764720pls.13;
        Sat, 29 May 2021 02:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7s8ZhyNQUw+UIP5eYDHwZKuA7eySANOZzZgL//iN93U=;
        b=VwYJFr7B3wGCCnrHbrolmwb1NkoeuWV6S2GqKzfLFOlTDgyL8yC21ulMPmVoDFv32x
         UrMzR0C/E4tdks8guFhXwwHThnwmSB3bXJIxCIIaw74sgOmS+XqSAWfdzQkdLdUP0oFM
         1kCd8y8ygj4CMWGGVi38/+wdhYLhQnVgMFK3vCoxJYJ7nmN1TX4F/rf1py6LHucdDG1F
         7PetRsV7LtO661+54pDf6x36b2TIHgeZVGiY2iGTHlQdu3IT39a6aPqnCq00uV4VfVmR
         ttUmDvf513Vii+tsO8gA1TwTBOeQ9E+VyV5Hg1TTQnFwoDK67lA8HF8aE7Lu7L2jUDH0
         X68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7s8ZhyNQUw+UIP5eYDHwZKuA7eySANOZzZgL//iN93U=;
        b=iY/CrVgid46B4Kb1dILnlcDHUMwa1NKWTRIqAPBeGddqx8s1j/pjM/0fP0f+yg/OAX
         +dALbxNsHIi8fhORoeNiWEM2Vx6HVzYqvkMjtGc3x0H1dPXY3McaQBxSBB0IP/Dark48
         vQPKRjNb0oNL2C6YKN4Blc0M9JChj1a6PBc3Y+c3fec6xMmsHIQCzdUg7jn9v5y4xLyV
         SVl0viMq3w2SHKhGgLYxUBpxUVp92cpdgPo8l3TQ9Vj4KVC2QmOK0om9tH1wxLzhhxkf
         8HJjszBTKhezxmEvYN2Lz+PeDkiYYJ/eegxDVF3Sj36TZVqbLS3ipmh1qLQPFXy7X1/R
         JmQQ==
X-Gm-Message-State: AOAM532nZVfC5/xUUDLiZZkU0f8RggB7K7meoNOGzEKiXG9QTelo8LEP
        CVxwzumHYAMrAJopedyv+92MZB3BmdYv0/6DHRk=
X-Google-Smtp-Source: ABdhPJwwGAMEU0zYOZjQ5L2QGZRW9vieb4sKCQED6DWY4fwepEeQELPI8U3dAD5d7eWhx8uWC9IHznCCS3NAj8lmJ0g=
X-Received: by 2002:a17:90a:80c5:: with SMTP id k5mr1258939pjw.129.1622281369926;
 Sat, 29 May 2021 02:42:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
 <20210510095045.3299382-3-andy.shevchenko@gmail.com> <20210528100339.GD2209@amd>
 <YLDJWV4HYvBJYcq0@smile.fi.intel.com>
In-Reply-To: <YLDJWV4HYvBJYcq0@smile.fi.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 29 May 2021 12:42:33 +0300
Message-ID: <CAHp75VfdLRq7YUVuy=gf+Q42jwmmYRt=G-cwXcLJ60DG2tuurA@mail.gmail.com>
Subject: Re: [PATCH v1 02/28] leds: core: The -ENOTSUPP should never be seen
 by user space
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?B?TWFyZWsgQmVow7pu?= <marek.behun@nic.cz>,
        Abanoub Sameh <abanoubsameh8@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jacek Anaszewski <j.anaszewski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, May 28, 2021 at 1:43 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Fri, May 28, 2021 at 12:03:39PM +0200, Pavel Machek wrote:
> > On Mon 2021-05-10 12:50:19, Andy Shevchenko wrote:
> > > Replace -ENOTSUPP by -EOPNOTSUPP when returning from exported functio=
n.
> > >
> > > Fixes: 13ae79bbe4c2 ("leds: core: Drivers shouldn't enforce SYNC/ASYN=
C brightness setting")
> > > Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
> > > Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> >
> > Are you sure this is real problem?
>
> (Potential) real problem, yes.
>
> =C2=BB This does not sound like an error
> > path that should happen.
>
> Before crafting this patch I have checked callers and _luckily_ they have=
n't
> tested the returned code. But if any of the user decides to check -> real
> problem.

I have rephrased the commit message to point out the above.

--=20
With Best Regards,
Andy Shevchenko
