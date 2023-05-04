Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F03EB6F66CE
	for <lists+linux-leds@lfdr.de>; Thu,  4 May 2023 10:07:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229905AbjEDIG7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 4 May 2023 04:06:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230220AbjEDIGd (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 4 May 2023 04:06:33 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61F2540F5
        for <linux-leds@vger.kernel.org>; Thu,  4 May 2023 01:05:57 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4f139de8cefso7591587e87.0
        for <linux-leds@vger.kernel.org>; Thu, 04 May 2023 01:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683187541; x=1685779541;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t4LT3YB4u2kd5z/RWBMbjCAOcTOQrvwDZJQTOmFhL+g=;
        b=X7Zgx4by1oBbvRpA21bNjzocLrrVCE1j8PBXjjSTcHtQJ+vI69KFiz72OHgjIiaJ/m
         oKLtU0+FApOkOwNrvCU3ipRkxwWilIHXyDIDcI5KlQwQN91AqFJd9xzMrBc9Zd2Uh239
         /6I9UJp5K/XqIZjO1k8o67YOUYqVDk65jAf0pETL0z6xZ6YXp0hzfksffIwAOs6hYTRW
         JHBHAmKT20+6bYgVuHUJLeg91bqrs75tsNJdwnxZsOiPY40TzVsbA4OKWYbarkValNL4
         oxWoTleR/5EJM6RZg0nEqiHvVas9N5IIAlKQ216r6b3110kOP29hyyQenPKuDYrF78m7
         hlVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683187541; x=1685779541;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t4LT3YB4u2kd5z/RWBMbjCAOcTOQrvwDZJQTOmFhL+g=;
        b=CLUqF0welcxsHKJSYbsJe8svPqUVbXJicFXiL31mmD3pnVsJLJb5RHKCXqXzWSPfxK
         xHYYQTJSRofb9X/n6rgP7XvoG4u8FCQGTyCHYsHkcUIozEQBmqfA0YxOIVinH8B1FztF
         XC4w7BqsXmsWW4CRm5xrOCMHwjmeX81NKWYWtEV8ToQvl1k8THtmQaBWLf18MhG/A38Q
         fzwvBKZtTuCzDPIWlNYub4gdMVO8gfpZQyfqy4kug5fAWuwtIzHTEO4iJ1kI0FjHju7u
         Jo9OQcO2lmYDzNDKYklgqx/2xhTohsP57QhIllYm7oaouN/OKOK8rKPoux8SLHj/Yd8U
         hwLg==
X-Gm-Message-State: AC+VfDwFcfRFgCTVXYk97ef2beeyoBpUvcSW6b9XXQ98OIgY19BOVG6+
        iQuXHCdF9SEc/uI7rXjXcgw=
X-Google-Smtp-Source: ACHHUZ7FSxM+Akiy8crqNfa4UH3sVi77FuF0GNNMMPdLd4N9W89VpSlT+KMpUrGkViNgYt/+c9ZyDg==
X-Received: by 2002:a05:6512:3983:b0:4eb:41ac:e33 with SMTP id j3-20020a056512398300b004eb41ac0e33mr1375615lfu.19.1683187541427;
        Thu, 04 May 2023 01:05:41 -0700 (PDT)
Received: from localhost.localdomain ([46.251.53.180])
        by smtp.gmail.com with ESMTPSA id h12-20020ac25d6c000000b004db3900da02sm6356416lft.73.2023.05.04.01.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 01:05:41 -0700 (PDT)
Received: from jek by localhost.localdomain with local (Exim 4.96)
        (envelope-from <jekhor@gmail.com>)
        id 1puTy8-00BdUN-0u;
        Thu, 04 May 2023 11:05:40 +0300
Date:   Thu, 4 May 2023 11:05:40 +0300
From:   Yauhen Kharuzhy <jekhor@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH v3 0/5] leds: Add Intel Cherry Trail Whiskey Cove PMIC
 LED driver
Message-ID: <ZFNnVPXFLNVDwYSc@jeknote.loshitsa1.net>
References: <20230430195952.862527-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230430195952.862527-1-hdegoede@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, Apr 30, 2023 at 09:59:47PM +0200, Hans de Goede wrote:
> Hi All,
> 
> Here is v3 of the patch series to add support for the LED controller
> on Intel Cherry Trail Whiskey Cove PMICs.
> 
> Changes in v3:
> - Some comment tweaks and s/LED_OFF/0/ and s/LED_ON/1/
> - Refuse to load on the Yoga Tab 3 as it turns out the LED1 driver output
>   is connected to a haptic feedback motor there (and LED2 is unused)
> 
> Changes in v2 (of my version of this):
> - Address Pavel's small remarks on patch 1/5,
>   see patch 1/5's commit message for details
> - Improve/extend pattern docs in Documentation/leds/leds-cht-wcove.rst
> 
> This is based on the original patch for this from Yauhen Kharuzhy,
> with additional work on top by me.
> 
> This addresses the review remarks on the v2 posting from Yauhen:
> - Since the PMIC is connected to the battery any changes we make to
>   the LED settings are permanent, even surviving reboot / poweroff.
>   Save LED1 register settings on probe() and if auto-/hw-control was
>   enabled on probe() restore the settings on remove() and shutdown().
> - Add support for the pattern trigger to select breathing mode
> 
> This makes the charging LED on devices with these PMICs properly
> reflect the charging status (this relies on sw control on most
> devices) and this also allows control of the LED behind the pen
> (digitizer on) symbol on the keyboard half of the Lenovo Yoga Book
> 1 models.
> 
> Regards,
> 
> Hans

Tested-by: Yauhen Kharuzhy <jekhor@gmail.com>

Works at my Lenovo Yoga Book YB1-X91L.

-- 
Yauhen Kharuzhy
