Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF6D9394BBE
	for <lists+linux-leds@lfdr.de>; Sat, 29 May 2021 12:46:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbhE2KsE (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 29 May 2021 06:48:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbhE2KsB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 29 May 2021 06:48:01 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07714C061760;
        Sat, 29 May 2021 03:46:25 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id e22so4468482pgv.10;
        Sat, 29 May 2021 03:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nh9/ZWlSwITR3jAdaVe3Wq51dfqcTRkUElzVjibwV70=;
        b=m3gqS9dIdGo598z7IbKAAaBFFe4NZxYR3WdUH20/bmDBVoSzaNLfBJQDzZ4ro93lvn
         IoXxfFusWGS1NNEncKLC3jhCWThdNq4r8rrmXhJlyz9vWHttxe2B66KYfqcP/ghIUnsp
         vsca6NJghBXhj/d8P+JvOZLZUEqNg/1mJm4QFewvNqDRPtn1TWOF2Kg9HEn346Jgyf2m
         MlpOaiht2g/T5vqzHRVeVh8Ocn1/XGnpEB1fTCFfOkwkOPcxS4PDSuGwrlnwAcK5Lcg2
         n6eogCcETWy4mmHUo+E3FWewjq8x9uH+LpfSAzA5EgoUObsRHv2XYGJInzHt1QtfOCsu
         BF1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nh9/ZWlSwITR3jAdaVe3Wq51dfqcTRkUElzVjibwV70=;
        b=IzZ0xDuYdIKDxqhn8C2lLI58olzfjAF6U3UOT2dP1lkCDSIGhbIcLBqcKCXlNR4984
         Imu2fdWDan6HpyE5k47j3GXhzfJjtFvUvh+uWSKVbH0I94UEtp08zPKVEpnBl5g2QYFb
         Rw/dluAMvNNdkJklNv9QUzvhhtGUdSeCkCv8AjAtSPKRmmZrIsH56H2EevG2brkmCCxn
         3yyYTyRzR7+G1Ae/AgfgidiJXwHQi81EBBQVa5s9VxkF0gaR2eZV/yjw7DThhNqqe+og
         rN0J+qaOPHcLayVqcxBJEu0im8yDeEXf15c/9HN6vOCf36PMwt8jTRyvBDXFaa9ciDWP
         8Y4g==
X-Gm-Message-State: AOAM530qEGjqpg0r4Xj0Cb50CJYx9+bmdK5FOdFKqPBMzmZDqDz9ZrDr
        qaYykjBNy+mmZt3ZCg0IVxn6zwZzXKSjHGWlQfI=
X-Google-Smtp-Source: ABdhPJzViolrkMg1tSCI79b8cwCkd2GY/ICw2C73TqHBl4RzJmMULM9dcxtGnAaQ29yQlnXY919eXVOQmHtmYgvvAMY=
X-Received: by 2002:a05:6a00:1591:b029:2d9:369a:b846 with SMTP id
 u17-20020a056a001591b02902d9369ab846mr8269573pfk.40.1622285184511; Sat, 29
 May 2021 03:46:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
 <20210510095045.3299382-9-andy.shevchenko@gmail.com> <20210528100800.GF2209@amd>
 <CAHp75VdYDk21OpHyxou8GQ5RtyjA0Dxppj=DZaHg4yqszcdYPQ@mail.gmail.com>
In-Reply-To: <CAHp75VdYDk21OpHyxou8GQ5RtyjA0Dxppj=DZaHg4yqszcdYPQ@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 29 May 2021 13:46:08 +0300
Message-ID: <CAHp75Vd4K1KG5VRsfDCMWftKmdB=1M9+UoGVtacaOtcWES9wrA@mail.gmail.com>
Subject: Re: [PATCH v1 08/28] leds: lgm-sso: Put fwnode in any case during ->probe()
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Amireddy Mallikarjuna reddy 
        <mallikarjunax.reddy@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?B?TWFyZWsgQmVow7pu?= <marek.behun@nic.cz>,
        Abanoub Sameh <abanoubsameh8@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat, May 29, 2021 at 12:28 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Fri, May 28, 2021 at 1:08 PM Pavel Machek <pavel@ucw.cz> wrote:

> > > @@ -734,10 +736,15 @@ static int sso_led_dt_parse(struct sso_led_priv *priv)
> > >       if (fw_ssoled) {
> > >               ret = __sso_led_dt_parse(priv, fw_ssoled);
> > >               if (ret)
> > > -                     return ret;
> > > +                     goto err_child_out;
> > >       }
> > >
> > > +     fwnode_handle_put(fw_ssoled);
> > >       return 0;
> > > +
> > > +err_child_out:
> > > +     fwnode_handle_put(fw_ssoled);
> > > +     return ret;
> > >  }
> >
> > Just delete the return and you get the same effect, no? No need to
> > have two exits here.
>
> Okay, I have tried and neither result is better:
> option 1. Add ret = 0, but keep the label
> option 2. Assign 0 to ret at the definition stage and replace return
> with break and remove return 0 (I don't like that ret assigned to 0 in
> the definition block. It usually may lead to subtle errors)
> option 3+. Something I missed which you see can be done?
>
> Which one do you prefer?

I found option 3 which is better and follows your suggestion (I suppose).

-- 
With Best Regards,
Andy Shevchenko
