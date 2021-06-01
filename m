Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F43B3970E6
	for <lists+linux-leds@lfdr.de>; Tue,  1 Jun 2021 12:06:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231201AbhFAKH7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 1 Jun 2021 06:07:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230262AbhFAKH7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 1 Jun 2021 06:07:59 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAC0CC06174A
        for <linux-leds@vger.kernel.org>; Tue,  1 Jun 2021 03:06:17 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id a4so18428997ljd.5
        for <linux-leds@vger.kernel.org>; Tue, 01 Jun 2021 03:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uYSLokhZOVToHjDX8YvfZ/GTnhI3Vsb7W4Dw5LRfxX4=;
        b=tYuVyBl2SRvpemlHslfjIJuF62dTsodKJWlDgxntpqhM/T/7Uh2PzC2irWjNsXNC50
         hf/wxmwRjEt1r40E1Ie/Mqd+eEilnkB0LFj6nUn3ZwXTqjuh8M4RtgFn39lUBPlFwTfQ
         kcsrYTg1x8BFQj6Gb7ZmkI+7NNmKw2ywQF8t1BLOSyKQpPosQaefBQsvta8I4Rpwed08
         rhc8SjcSuWleV0RSdXwCkmU0BqsBT/V8rMtxLOZFWpAL7kksN/wdEprzSauYDYD6O7BH
         XsTm0qd9GJ49tm5z4Fh8r5EkPcVUFRSFhSJiZ7RWAEUQyb2ijbxN1LVM6cgNqkiNixK/
         xlQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uYSLokhZOVToHjDX8YvfZ/GTnhI3Vsb7W4Dw5LRfxX4=;
        b=iyrQebP0EEj/0UB53bHgiDOFoEJWURcoOIj/gfjyWWsFFHNgAclMnoj0H8Y7Ow8Uey
         vsQ/IrAbXzrIw1xInYiZoTH7XLMxUtSY0NDkSrw9tc7oksYxQPjeGT/lUSUGgF7DkfjD
         Fq9N8vtjfZBxXgW2dElkubnh0KHaC3l08aJ5bD0YqLQfRTwPoB9cUi6pzEUKXonCEm9Z
         pzkigu/HCdMbIBihuVectS2CRnSKisywl/yPaXNUknlVDDJKVyWlKleXNqKKWzGKg27P
         93wjbgI8D0jlb4Hcj+llB+3uaFjW9EwL34oDb10kkU4GHwtgO6auo79if5G5i46KQxch
         yesw==
X-Gm-Message-State: AOAM531R4slon14F0Bi+87qiMz85bS9gG1wWTdNUy5GQLybC3H59Jysl
        LgxSMyhrbvzcWd/z8PwxOOr3wGxCKL9vFafR5QjyXA==
X-Google-Smtp-Source: ABdhPJyBsSoyWIetFnXXUIljoJ53aFPzpaF/jLvNpZkUb18d9ksScipYnaimUIICpjvLU7/LSl2KCQXoeMnIbRM8ikU=
X-Received: by 2002:a2e:22c3:: with SMTP id i186mr20730123lji.273.1622541976021;
 Tue, 01 Jun 2021 03:06:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210529111935.3849707-1-andy.shevchenko@gmail.com> <20210529111935.3849707-12-andy.shevchenko@gmail.com>
In-Reply-To: <20210529111935.3849707-12-andy.shevchenko@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 1 Jun 2021 12:06:05 +0200
Message-ID: <CACRpkdb21tMWyoxHuv8CwUB9fZeD332B_ui2jtMP7ocfbi6LSQ@mail.gmail.com>
Subject: Re: [PATCH v2 12/13] leds: rt8515: Put fwnode in any case during ->probe()
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Amireddy Mallikarjuna reddy 
        <mallikarjunax.reddy@linux.intel.com>,
        Abanoub Sameh <abanoubsameh8@gmail.com>,
        =?UTF-8?B?TWFyZWsgQmVow7pu?= <marek.behun@nic.cz>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat, May 29, 2021 at 1:19 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:

> fwnode_get_next_available_child_node() bumps a reference counting of
> a returned variable. We have to balance it whenever we return to
> the caller.
>
> Fixes: e1c6edcbea13 ("leds: rt8515: Add Richtek RT8515 LED driver")
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
