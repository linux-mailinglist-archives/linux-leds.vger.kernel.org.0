Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5D92394B50
	for <lists+linux-leds@lfdr.de>; Sat, 29 May 2021 11:28:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229640AbhE2Jab (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 29 May 2021 05:30:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229559AbhE2Jab (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 29 May 2021 05:30:31 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D8A7C061574;
        Sat, 29 May 2021 02:28:54 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id n12so1157778pgs.13;
        Sat, 29 May 2021 02:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2lh2HqwAQGOj5kWpf6oWmfpwSzHRW5V1cnXqnsFFVhw=;
        b=UW7DXCenIWgyhTBJTmbY9iHt6VZpLaHzVKAr+CJysz1yQLgM7vV6erlKebG37lVFaE
         zdiervS6dJMY01zInCCEg3YxYdHIHwgcyVH57asBGTuH16bmdy2xuYpOU+NSbgW6AkdU
         n1b8aI/0zX7ryIsmC3/PdlFqy7je/pYEQQjaV3cG2rhopB8hgUABCa7+pPmEt6LgVqc+
         iLBe9XLaW1sLsh+qa9k+Iz/eUymPhqQr+Yh1hpM5ar3QPloNl3rU2aiTAs26X5UundBc
         WFBQhmaX7Wmj0caVQHdyVTiFtwP34t70lzxU4KzGnxIUGdRwnhPxSqoMKzjdlnlw4DaL
         NNNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2lh2HqwAQGOj5kWpf6oWmfpwSzHRW5V1cnXqnsFFVhw=;
        b=r0v05GA4AkM5f8CaP9qu5WDsZz+uQ3MxtH209sgV3GpnVkod8qmOqkrh3xSgFM5GJQ
         AReKkZ/KTzvJNdQaW2lLLjN0GNX1Hyo/C6S3RVGDYsGYCzCBQq0jZB8tAZcsUxqiEc15
         idE46tTS59bPmcmXRTBN1cHiJBMvmCs1lRlA7ETox707H8KgCn1pPmI2/bMlRHaRu7nO
         Zhw2Nivv5+VQzTlhNbwPityd1lEL980pWtsmjgk4jH5Jj4V5p1aD35VcrWpFJGsNH2O3
         TkRkcu7CgPKfP5GIRT6FaSHdxBfPPDQ5wpP1uF9kwxx2lUqEJzIiVmWxFhl5ByHDrdZw
         hDHw==
X-Gm-Message-State: AOAM531K5R96sgg61XgzD1a972P8uYFXRIl9ulRHhwFg6pcTffNbt8FT
        v+iMgXwegPziruTD3eXZXEnqu2VL6aYqCTqCE6M=
X-Google-Smtp-Source: ABdhPJzHprQj9PsnVBPoT2RDMYotOj5blsH2uy1cG3LzpwKLuueVJYmpRodfDzcb/Xa9ZzkR7x1u3xUbeIf7C7B40rg=
X-Received: by 2002:a05:6a00:a1e:b029:2e2:89d8:5c87 with SMTP id
 p30-20020a056a000a1eb02902e289d85c87mr7936284pfh.73.1622280533583; Sat, 29
 May 2021 02:28:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
 <20210510095045.3299382-9-andy.shevchenko@gmail.com> <20210528100800.GF2209@amd>
In-Reply-To: <20210528100800.GF2209@amd>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 29 May 2021 12:28:37 +0300
Message-ID: <CAHp75VdYDk21OpHyxou8GQ5RtyjA0Dxppj=DZaHg4yqszcdYPQ@mail.gmail.com>
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

On Fri, May 28, 2021 at 1:08 PM Pavel Machek <pavel@ucw.cz> wrote:

> > @@ -734,10 +736,15 @@ static int sso_led_dt_parse(struct sso_led_priv *priv)
> >       if (fw_ssoled) {
> >               ret = __sso_led_dt_parse(priv, fw_ssoled);
> >               if (ret)
> > -                     return ret;
> > +                     goto err_child_out;
> >       }
> >
> > +     fwnode_handle_put(fw_ssoled);
> >       return 0;
> > +
> > +err_child_out:
> > +     fwnode_handle_put(fw_ssoled);
> > +     return ret;
> >  }
>
> Just delete the return and you get the same effect, no? No need to
> have two exits here.

Okay, I have tried and neither result is better:
option 1. Add ret = 0, but keep the label
option 2. Assign 0 to ret at the definition stage and replace return
with break and remove return 0 (I don't like that ret assigned to 0 in
the definition block. It usually may lead to subtle errors)
option 3+. Something I missed which you see can be done?

Which one do you prefer?

-- 
With Best Regards,
Andy Shevchenko
