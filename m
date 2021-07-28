Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFE743D8BAC
	for <lists+linux-leds@lfdr.de>; Wed, 28 Jul 2021 12:27:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233513AbhG1K1D (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 28 Jul 2021 06:27:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232113AbhG1K1C (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 28 Jul 2021 06:27:02 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BAB5C061757;
        Wed, 28 Jul 2021 03:27:00 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id n10so2113115plf.4;
        Wed, 28 Jul 2021 03:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=BCXW7rimMR0GK6oVAu3Jqw5jfi+9WgPrGlYLOAnOXuk=;
        b=NY6Oyz1rOc8R4xy0XKCuvPfbb9M9p4rP9C6xkq/g0KcR++sMqIofv+Gyga1taYpfhh
         58hYyfd1h3a/6/ttb5Gh5IZ3kebtWGtUlWjG5S85TsEhSWpjOKzOMNM6yNA34+kGmXSU
         BWbEt2JaAr/2hw7syFyAXH5o4za9iRfravoTzEuFa5ei8Aw3R5rjf+Bv5RNrzlGj6Yy8
         hrYa9utubMVL5NLKrpJ0sDNg1/ZJOMAg3OjQXyVnNXWR/+A47NTFQoYa7MQrrEJ3oQ2U
         RDHJnGc102j3X62BNd8pYOok4VW7mlsQk0NmYkLmG8OC+aafKnLlC1YT31rkE3drhd+o
         J8tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=BCXW7rimMR0GK6oVAu3Jqw5jfi+9WgPrGlYLOAnOXuk=;
        b=luvVa7GrOp7JLIPcm2rGFWJqfB7a5hcdrHALLo9ZBmNupX5WBZvoNvC9xeBlkU2XAZ
         k/oOKtR4StAQbs3cJrnT8lIP5ZFQTjf7Zw0rh8aKaSORnLdD/UG48GdowUBz+9zPvyMs
         MaXZhTP7lL+K7LS6hi7n0t4jYRRnVYU1umi2FWujDFA0347aDYICWZ842dG5UBnvXwBi
         10qh2RY1Eqao3yHwADarpsD1ByAx+gu01oGQZkYkP1gYwSBjeelDtnRi6dKjWNQrlYzJ
         3vcm1EUvWViDzc1o5QVCN8cx+yYW/hbJKNWckHi+MgWIT2NR900y3O0c7/dGCXptvbny
         8Qzw==
X-Gm-Message-State: AOAM530wdILw0XoogL63URxlYwBliuYWJvk5VRSB0dVzD5+5W39xfTZv
        CRhoMNlZBKsuGnjWugW134vHdVobDsni7Sr/4oCQraayW5E=
X-Google-Smtp-Source: ABdhPJwHh76x/sYcHfqaNbckyTVS0PFSuyFKvqLRDQYXBOzPoFd1LxCCs7Wk7cwwA4QFCapV94Rb7RM46pRkU8ygHgE=
X-Received: by 2002:a62:cd8b:0:b029:356:3484:b7f1 with SMTP id
 o133-20020a62cd8b0000b02903563484b7f1mr27768281pfg.73.1627468019865; Wed, 28
 Jul 2021 03:26:59 -0700 (PDT)
MIME-Version: 1.0
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 28 Jul 2021 13:26:20 +0300
Message-ID: <CAHp75VeWKgyz32scczN0c+iJwGZXVP42g0NG0oXrdJ34GyHB8w@mail.gmail.com>
Subject: LED subsystem lagging maintenance
To:     Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Pavel Machek <pavel@ucw.cz>, Pavel Machek <pavel@denx.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi!

I have noticed that in the last couple of cycles the LED subsystem is
a bit laggish in terms of maintenance (*). I think it's time that
someone can help Pavel to sort things out.

In any case, I wonder if we have any kind of procedure for what to do
in such cases. Do we need to assume that the subsystem is in a
(pre-)orphaned state? If so, who is the best to take care of patch
flow?

*) e.g. I have a series against a few drivers in LED with actual fixes
and it is missed v5.13 (okay, that time Pavel had comments which I
have addressed at ~rc7 time frame), missed v5.14 and seems on the
curve to miss v5.15.

P.S. I Cc'ed lately active, AFAICS, in that area people + Greg for his opinion.

-- 
With Best Regards,
Andy Shevchenko
