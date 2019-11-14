Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4117BFC53E
	for <lists+linux-leds@lfdr.de>; Thu, 14 Nov 2019 12:24:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726002AbfKNLYz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 14 Nov 2019 06:24:55 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:55075 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725977AbfKNLYy (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 14 Nov 2019 06:24:54 -0500
Received: by mail-wm1-f68.google.com with SMTP id z26so5258136wmi.4
        for <linux-leds@vger.kernel.org>; Thu, 14 Nov 2019 03:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flowbird.group; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=M7cm+fLydaE7vlZimi8Trm6gsX1LXO9Kv4DMDE9E2a4=;
        b=XzKnS/ZlZ5mnyKPhJ3ZRsgZJx3bd8m1dDrS+3vnADo8LkOTj6Jfli87r/jpkrWImiy
         qHL7W8hjCSvkga9PfWzIiAkzyp+GYg7D8sNx0XQZ7t1ML8LBHgHJrqaAUzVUBJyPgPmK
         ZPvaGTf0MFtGFQV5goJuoMcGPTH3vdvCuJDhnwZtEZYvDPNkhg007wZBwD2LnFQhmxXJ
         LDPAwl+zigBI7PfJG144K2G+qK2r+LAdR/RDGdxVwKcDzGR8SqbeBNuvjYDx1C9PCHYs
         k4S5iycZfMLoUShDmPEku3NSkyRZvOutMMBUXVnY2cYmywj0HJxbVh/+gbsSfNpsLBvE
         Ji1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=M7cm+fLydaE7vlZimi8Trm6gsX1LXO9Kv4DMDE9E2a4=;
        b=H7yXBcuetH7D4myJ0LwghMxWLfQsA9I3jxX2PeeAohwxQPdv33BVm2dSe8P40VvIvn
         9Kb4+msKHbY885xvxG22ZWkAqxuCgCJ6uR6dUKZwEAembDlrsmkCC8KjtwdBB+Pcyo/K
         KXTLJJaGFFQGWcODL8G3iday3eXR021Xr0BJ/vfe1vtIb83J++RYl4M6M2RR0cQDD5EN
         bbkGUvsDw+weuvUaVy2rb9I2mvHC1XLjL4YpcDHn0ufqqwCbDwD2TG+S4Ihbrci2TJGb
         KYrHn6nuRcTKJx0nBhk9Rc0Fy7D3BB+QJe2iPg3723N0WtNQ/PrzBkTRmeFsGpgqyHi2
         Z+Wg==
X-Gm-Message-State: APjAAAXPRx8OSO296lLessTT9UL08ts/flYtmBd5UHyajShymMOJZl4W
        /nZlrJThiXctULMcKiT0tc6P7Q==
X-Google-Smtp-Source: APXvYqwkHaDLIrBB2ahBogSdVlv0JY5yaRiYNBcNunBMV00UbkQodqHpIzZqO/WQFF/MWnMIYUX27A==
X-Received: by 2002:a05:600c:cb:: with SMTP id u11mr7280243wmm.5.1573730691206;
        Thu, 14 Nov 2019 03:24:51 -0800 (PST)
Received: from [10.32.51.158] ([185.149.63.251])
        by smtp.gmail.com with ESMTPSA id b1sm6346761wrs.74.2019.11.14.03.24.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Nov 2019 03:24:50 -0800 (PST)
Subject: Re: [PATCH v16 04/19] leds: multicolor: Introduce a multicolor class
 definition
To:     Dan Murphy <dmurphy@ti.com>, jacek.anaszewski@gmail.com,
        pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191104123707.31930-1-dmurphy@ti.com>
 <20191104123707.31930-5-dmurphy@ti.com>
From:   Martin Fuzzey <martin.fuzzey@flowbird.group>
Message-ID: <a7f18f3b-c1fb-3810-8d9b-30ecdada96ff@flowbird.group>
Date:   Thu, 14 Nov 2019 12:24:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20191104123707.31930-5-dmurphy@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: fr
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Dan,

On 04/11/2019 13:36, Dan Murphy wrote:
> +int devm_led_classdev_multicolor_register_ext(struct device *parent,
> +					     struct led_classdev_mc *mcled_cdev,
> +					      struct led_init_data *init_data)
> +{
> +	struct led_classdev_mc **dr;
> +	int ret;
> +
> +	dr = devres_alloc(devm_led_classdev_multicolor_release,
> +			  sizeof(*dr), GFP_KERNEL);
> +	if (!dr)
> +		return -ENOMEM;
> +
> +	ret = led_classdev_multicolor_register(parent, mcled_cdev);


This drops init_data, should be led_classdev_multicolor_register_ex


Regards,

Martin

