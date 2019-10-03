Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1451CAF15
	for <lists+linux-leds@lfdr.de>; Thu,  3 Oct 2019 21:21:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730382AbfJCTVN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 3 Oct 2019 15:21:13 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:42894 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726677AbfJCTVN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 3 Oct 2019 15:21:13 -0400
Received: by mail-wr1-f65.google.com with SMTP id n14so3965029wrw.9;
        Thu, 03 Oct 2019 12:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kgvlV2mcTljWAp7eZcNK1OhOjxWAq+NeHEujH2OXj0E=;
        b=XDzJkQ89M6Qzjw60aWTvWzA4dp8csNLPOmO9K10AsTyN6/8yKJ/mY3xFdh2YjDSWrZ
         GVrDIaEL2laR0ti8/r3w9pWRAd+rBHePckK8zfZH79iRayn2QjsVUg8pK97NuMXDMk81
         slSIPiEgC2iqd8QqVTNQZK8ekfExVsRiFr0LV6auoXgdJ9DJpLmsQ9qwQ6/mo6JeG7BV
         rO9pYg/gOIJDSMuArz+8y2xOfOUdwPbU9uk4wzirvCzh5thTkfU671B1LSK9klguNiLS
         xRYp6fNC26hA1eu0MpJeX5nbLPiOihkkztABV9VTL80IUI9gTNXCPpWlcIiNuOgNl9pO
         xRwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=kgvlV2mcTljWAp7eZcNK1OhOjxWAq+NeHEujH2OXj0E=;
        b=olE0kOsuSdTBHcRTGqc9iqAu9jlM5S1cIuu+UF/DXuMuJDzw89hvheCeee/GXmucIA
         5jxGh2ibnaehyzVod3MFaO0/geFNHL+aQwaMVH4uKQWLoYv6I2DU2BTu6whvjrz7rQAN
         nYVqTl/bKdNYAOeR0s2lZLNVk/yGovdAN8lL4O4F/MjWRiAZ6ZML+INFddxREPMN9q5A
         OLnVDSGjGgRUUjL81hmlPHzs19eeHMwDbBj1QckyZOibUiOZ6Vle0f1ihgx03ukBVjW9
         RMB911tMEObwJFJW9iO+hCKqM688JTj/Aih568zSL3QrH2lUiIWifkMQ6hgRJ9BrUIzX
         vRfw==
X-Gm-Message-State: APjAAAXOwJqB4ufiZkXC/Pyy3ZtTIS3EdXPud8/xcBDCqXRll8DVl7gB
        xPwPn4ibToy6HBQTVmqDZ5Q=
X-Google-Smtp-Source: APXvYqxqtuS84uQp720YiKUzMs5xcqZUqhV++5X5eY+D2lhtrEu+g/ezi2rBJ3ov1WgonS7FNRuBkQ==
X-Received: by 2002:adf:fcc7:: with SMTP id f7mr8221596wrs.319.1570130470488;
        Thu, 03 Oct 2019 12:21:10 -0700 (PDT)
Received: from [192.168.1.19] (civ244.neoplus.adsl.tpnet.pl. [83.31.45.244])
        by smtp.gmail.com with ESMTPSA id 94sm6406792wrk.92.2019.10.03.12.21.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Oct 2019 12:21:09 -0700 (PDT)
Subject: Re: [PATCH v8 2/5] leds: Add of_led_get() and led_put()
To:     Mark Brown <broonie@kernel.org>
Cc:     Jean-Jacques Hiblot <jjhiblot@ti.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com,
        lee.jones@linaro.org, daniel.thompson@linaro.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        tomi.valkeinen@ti.com, dmurphy@ti.com, linux-leds@vger.kernel.org,
        Liam Girdwood <lgirdwood@gmail.com>
References: <20191003082812.28491-1-jjhiblot@ti.com>
 <20191003082812.28491-3-jjhiblot@ti.com>
 <20191003104228.c5nho6eimwzqwxpt@earth.universe>
 <acd11fe1-1d51-eda5-f807-c16319514c3a@ti.com>
 <62591735-9082-1fd7-d791-07929ddaa223@gmail.com>
 <20191003183554.GA37096@sirena.co.uk>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <25b9614f-d6be-9da5-0fe5-eb58c8c93850@gmail.com>
Date:   Thu, 3 Oct 2019 21:21:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191003183554.GA37096@sirena.co.uk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Mark,

On 10/3/19 8:35 PM, Mark Brown wrote:
> On Thu, Oct 03, 2019 at 07:43:17PM +0200, Jacek Anaszewski wrote:
>> On 10/3/19 2:47 PM, Jean-Jacques Hiblot wrote:
>>> On 03/10/2019 12:42, Sebastian Reichel wrote:
>>>> On Thu, Oct 03, 2019 at 10:28:09AM +0200, Jean-Jacques Hiblot wrote:
> 
> This mail has nothing relevant in the subject line and pages of quotes
> before the question for me, it's kind of lucky I noticed it....

Isn't it all about creating proper filters?

>> I wonder if it wouldn't make sense to add support for fwnode
>> parsing to regulator core. Or maybe it is either somehow supported
>> or not supported on purpose?
> 
> Anything attempting to use the regulator DT bindings in ACPI has very
> serious problems, ACPI has its own power model which isn't compatible
> with that used in DT.

We have a means for checking if fwnode refers to of_node:

is_of_node(const struct fwnode_handle *fwnode)

Couldn't it be employed for OF case?

-- 
Best regards,
Jacek Anaszewski
