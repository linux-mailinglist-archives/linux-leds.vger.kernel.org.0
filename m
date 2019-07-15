Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B8A269846
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jul 2019 17:20:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730673AbfGOPTs (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 15 Jul 2019 11:19:48 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54145 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730221AbfGOPTs (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 15 Jul 2019 11:19:48 -0400
Received: by mail-wm1-f68.google.com with SMTP id x15so15605700wmj.3
        for <linux-leds@vger.kernel.org>; Mon, 15 Jul 2019 08:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=HHztAI/ZQoVWsQtGtZCm40CW/6TH0AHaPswdjI5N1oQ=;
        b=mUMMPxaN+YcHfpcJeojEBde29eKqocO/DZ1FrwPpV6dC9y5f09wS6nUZWtc1tMnLuv
         w1kky1RxU5cFckBDOOsmjWc6qYct//DeNf8lxmicE6v2alZlhbSJz6c4C/KTNLJ/NA3Z
         eeJTQAV39FIouQXo3wyEP2I89bFZZ03QLZagts2eWDi6VbA3euGhZJVipzVo2tj6gV54
         Tmpzw9J9q5/e8rTXDKIulB1VPt46+sQK52s6i9iDNLp1KI6YMxCiadbheJTFkSEHc/JO
         nImamz6P3N1doomh0IYSSJz9EvXtQ9g/pMZQXiO/PcBiGaTT9aLek769kEERYMBnVIyH
         c7lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=HHztAI/ZQoVWsQtGtZCm40CW/6TH0AHaPswdjI5N1oQ=;
        b=HwOzsja/Md4xMXHwEdGqlWbrPISYlmSZFLyKlOJmObOq6OT0zIfKtbd31OffHkG9Pz
         VtlPD92uszgAf1nj9b3+OuXV5EcfNXp4pnXJf6KnSBG842GkbwNuWStAjqWVMjff/VSp
         TFqv/o6LNlcezc80yo3ha1QUx9puG0cLhRrJ6FmVOxqKRBR4wZ4aCbrpwUfoY03PrSUF
         8NFI8rV44/6Onv+BIRRP7ABPBosFRV+9U17PAWzZ0pFyz8ayTECGdwUaNE0oI34ZMzji
         oFm2U+TIulZWAyilPN8OK+PL9ZipZG2iWx/TOFFrHL7qUIkwFofQBv/fni8UzOLBSjR7
         mv6w==
X-Gm-Message-State: APjAAAXIuyrVDeA0PxYR5d6gahvBq9yzWQ1GhQdLs+mVXaOLN3r1rEdu
        aOgnZu2TVAUyWtPLhrc1G8PJog==
X-Google-Smtp-Source: APXvYqw1KkKk6QFk1n8Mx4/eZF0c9gqDHwWbqFleJnMcfVrqqH/7TK3PX3BO5WoKr9F0daRiY9Jdfw==
X-Received: by 2002:a05:600c:2146:: with SMTP id v6mr24391543wml.59.1563203985761;
        Mon, 15 Jul 2019 08:19:45 -0700 (PDT)
Received: from holly.lan (82-132-244-224.dab.02.net. [82.132.244.224])
        by smtp.gmail.com with ESMTPSA id g17sm13049119wrm.7.2019.07.15.08.19.42
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 15 Jul 2019 08:19:44 -0700 (PDT)
Date:   Mon, 15 Jul 2019 16:19:35 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc:     Dan Murphy <dmurphy@ti.com>, jacek.anaszewski@gmail.com,
        pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] leds: Add control of the voltage/current regulator
 to the LED core
Message-ID: <20190715151935.4ci23aqw4liz56fg@holly.lan>
References: <20190708103547.23528-1-jjhiblot@ti.com>
 <20190708103547.23528-2-jjhiblot@ti.com>
 <56d16260-ff82-3439-4c1f-2a3a1552bc7d@ti.com>
 <ab4818c0-bc7a-13e1-c6ce-e977b0234de0@ti.com>
 <20190715092400.sedjumqkecglheyu@holly.lan>
 <9c53f54f-d0d4-50d4-09da-34389085269a@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9c53f54f-d0d4-50d4-09da-34389085269a@ti.com>
User-Agent: NeoMutt/20180716
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Jul 15, 2019 at 11:47:08AM +0200, Jean-Jacques Hiblot wrote:
> > > > > +    if (IS_ERR(led_cdev->regulator)) {
> > > > > +        dev_err(led_cdev->dev, "Cannot get the power supply for %s\n",
> > > > > +            led_cdev->name);
> > > > > +        device_unregister(led_cdev->dev);
> > > > > +        mutex_unlock(&led_cdev->led_access);
> > > > > +        return PTR_ERR(led_cdev->regulator);
> > > > This is listed as optional in the DT doc.  This appears to be required.
> > > The regulator core will provide a dummy regulator if none is given in the
> > > device tree. I would rather have an error in that case, but that is not how
> > > it works.
> > If you actively wanted to get -ENODEV back when there is no regulator
> > then you can use devm_regulator_get_optional() for that.
> > 
> > However perhaps be careful what you wish for. If you use get_optional()
> > then you will have to sprinkle NULL or IS_ERR() checks everywhere. I'd
> > favour using the current approach!
> 
> Thanks for the info. I think I'll use the get_optionnal(). That will add a
> bit of complexity, but it will avoid deferring some work in
> led_set_brightness_nopm() when it is not needed.

Makes sense, I didn't notice that it allows you to avoid deferred work.


Daniel.
