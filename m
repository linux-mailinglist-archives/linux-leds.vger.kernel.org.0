Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E625266A08
	for <lists+linux-leds@lfdr.de>; Fri, 11 Sep 2020 23:26:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725816AbgIKV0s (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 11 Sep 2020 17:26:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbgIKV0r (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 11 Sep 2020 17:26:47 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28486C061573;
        Fri, 11 Sep 2020 14:26:47 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id a12so11543546eds.13;
        Fri, 11 Sep 2020 14:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=r3EJ/Ksz7XcLQJCTNqdi7sJEakcRZ8RCxklKxp4HF2Y=;
        b=s+WSqz4oDlukAHiTWLgvtTMhTe+5CIHIX0GX+q6q/DrgI3WS75X1PhN2Ny430K8WSF
         2Nxkw5F4MIytGPV1tlMED93OX99jXRvvKr+6I1iJorCIfozIKY6JRDBuvmVxLNx0lof9
         77btAd7wSY/pIoywPh213fvq7E9bqL9LaHjmLQI6yUt4vKFDJS0a/EmInHa9FF0S+LzA
         oopGoDoIohB+5Ey19FReYDxNymJuHPVXfzbIvt8YBtqZfgV9MFwyew+hZYn5rp6XBgRx
         Q7V7Yk4t3uF1nKuraIBQYV1UOgDS9Rj6+XW1m80yWvg3Rsn0CGxu7yHrKEw9oqmxqUTU
         Zrcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=r3EJ/Ksz7XcLQJCTNqdi7sJEakcRZ8RCxklKxp4HF2Y=;
        b=oIc+EznXfQYhQMSYS0V1/dnQSJJ3q8rjgBlwcFw9MTul6yj3gaUzhGzbCOZo1K2iq5
         rU+M3HG2pLCRu4GM555C6rAISwIVLPzCFfXzWBEINp06eIUAOqcJNW1LPZH22gK95T46
         DThHYo/lR5E0Z1IlkH2bDgZgeinoCZi8fvjVu5EBmdGtUgvInk110Gx3HhMyn19K5frD
         9xvuHGMo7sXOCSLdfyBOfeQorzdRZ0FtJlL5E+sLKndSgkVe8deu91w2fnBRMGBTYNg0
         ZxwmKkA8BIV+29wYiGwgFS06LN15RxtUe3LQclqTsO5JIiZT2qdHTo4OCZUB+rRZCX4e
         PoRQ==
X-Gm-Message-State: AOAM532XeGr+Wx5JX+7cVRfcrRqxW1X5P3+j+rOfBbCLEw5qZ9vgMVU8
        m+suXK+VVyTdjZWINL3Zsos=
X-Google-Smtp-Source: ABdhPJwY0lELgdKl+vuRtrtkNdjLQEPngs4dNY8DJ4LNqWTNInwWFm5V+vWNOsUm14D8Jwfd2Yv1bg==
X-Received: by 2002:a50:fe0f:: with SMTP id f15mr4499342edt.235.1599859605858;
        Fri, 11 Sep 2020 14:26:45 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:e953:3254:5e71:3177? ([2a01:110f:b59:fd00:e953:3254:5e71:3177])
        by smtp.gmail.com with ESMTPSA id o3sm2605182edt.79.2020.09.11.14.26.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2020 14:26:45 -0700 (PDT)
Subject: Re: [PATCH v4 1/3] leds: Require valid fwnode pointer for composing
 name
To:     Alexander Dahl <post@lespocky.de>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Alexander Dahl <ada@thorsis.com>
References: <20200911154004.28354-1-post@lespocky.de>
 <20200911154004.28354-2-post@lespocky.de>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <6652b897-5044-713b-6f06-83d07be0dba7@gmail.com>
Date:   Fri, 11 Sep 2020 23:26:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200911154004.28354-2-post@lespocky.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Alexander,

On 9/11/20 5:40 PM, Alexander Dahl wrote:
> The function 'led_compose_name()' is called in
> 'led_classdev_register_ext(()' only and in its implementation it always
> parses the fwnode passed with the init_data struct.  If there's no
> fwnode, EINVAL is returned and 'led_classdev_register_ext()' returns
> early.
> 
> If this is detected early the same fallback mechanism can be used , as
> if init_data itself is NULL.  This will allow drivers to pass fully
> populated 'init_data' or sparse initialized 'init_data' with a NULL
> fwnode in a more elegant way with only one function call.
> 
> Fixes: bb4e9af0348d ("leds: core: Add support for composing LED class device names")
> Suggested-by: Pavel Machek <pavel@ucw.cz>
> Signed-off-by: Alexander Dahl <post@lespocky.de>
> ---
> 
> Notes:
>      v4:
>        * added this patch to series (Suggested-by: Pavel Machek)
> 
>   drivers/leds/led-class.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index cc3929f858b6..3da50c7ecfe7 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -346,7 +346,7 @@ int led_classdev_register_ext(struct device *parent,
>   	const char *proposed_name = composed_name;
>   	int ret;
>   
> -	if (init_data) {
> +	if (init_data && init_data->fwnode) {

This does not cover the case when we don't have fwnode but we
have init_data->default_label that led_compose_name() can make use of.

>   		if (init_data->devname_mandatory && !init_data->devicename) {
>   			dev_err(parent, "Mandatory device name is missing");
>   			return -EINVAL;
> 

-- 
Best regards,
Jacek Anaszewski
