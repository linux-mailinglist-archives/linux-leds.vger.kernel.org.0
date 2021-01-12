Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 748A72F2F3B
	for <lists+linux-leds@lfdr.de>; Tue, 12 Jan 2021 13:38:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726451AbhALMh6 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 12 Jan 2021 07:37:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732988AbhALMh6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 12 Jan 2021 07:37:58 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80DB0C061575;
        Tue, 12 Jan 2021 04:37:17 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id y187so1974011wmd.3;
        Tue, 12 Jan 2021 04:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zMd+XHnFId1Wgsed2jprrzroN/fiYe/FbbKUqXbc1O0=;
        b=aWA3DhcWQA4MMreD6ZpfYBr9Teauz1ija7KFv0t8RsCuZ3BgBrC4psZs8ddKqaLHB2
         EO05spt+UYI/Qr+5fbAOB7i9a+iY7CV0ZJjLJzMQYYUPAJihDA0T3QC5Sbfz6lWBCzH/
         /XAPI0j+Ozy2pTr9of7gGDBbkx0VAmByJleOS+Esmo5Ge8JaHy4ztwrCW64L4agiq/kN
         HYlBLDRW0h6CdZrfGdwC/3aXBcXuaJlarGOV2kNXaLricmUn+sSztl/+NxdnEA7rT7s2
         o2f0OOpmiUjX3DPyR7Q18jfa43bLapYMzi7XObUWHV4bcY1GirEU6n2pbcgOn1Lx/mmm
         gw3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zMd+XHnFId1Wgsed2jprrzroN/fiYe/FbbKUqXbc1O0=;
        b=i/g/FnNZwdzOqreURI1ozo5qE5zXU3GlHXdfW78wlEfjTvui2HHnH0jTFXrwHaiiVF
         lkTQ0upMRV4YLgB4xBOEcK5hNtiTOkio5Uq3UTanU4D4dbZvg2fZ4+woDJ+EDAftf371
         Xb5oAgtPCBFYSrrSRKPncejQnC2oziGHwInGW4CaYfKWTaP0iqoppHOZ0oA88xqWb3yD
         l3n0RA1OCLg39uUnhF/7DBflatBSRJNFXCi2OWnUFshLOFIS2bDXh/WlmCBSzlBT2XjV
         7fLTTTXMKRW06BPT4CSdbY7rDmxT36lofENiljlzi5+p+HSjhULp63SjYwp7o4dnX+7k
         MKng==
X-Gm-Message-State: AOAM533W5UWo3FXe+2iSZo7Nb05D5/adHP4wLJxrlmopdZUzUI4kMWyy
        8JmJl/LBzIEzN1UL0utasO4=
X-Google-Smtp-Source: ABdhPJzZkIBM3vrqBllD/XocErsVNCfAdadbHNNKk+/k3bsFTvdI16XOCSkzqQsfYYoGVSRaasxoaA==
X-Received: by 2002:a05:600c:20f:: with SMTP id 15mr3446491wmi.36.1610455036332;
        Tue, 12 Jan 2021 04:37:16 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
        by smtp.gmail.com with ESMTPSA id o74sm4107446wme.36.2021.01.12.04.37.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jan 2021 04:37:15 -0800 (PST)
Subject: Re: [PATCH v13 5/5] leds: mt6360: Add LED driver for MT6360
To:     Gene Chen <gene.chen.richtek@gmail.com>,
        jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
References: <1608547554-6602-1-git-send-email-gene.chen.richtek@gmail.com>
 <1608547554-6602-6-git-send-email-gene.chen.richtek@gmail.com>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <1e752ae6-f973-11c3-1780-d11d2af497be@gmail.com>
Date:   Tue, 12 Jan 2021 13:37:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1608547554-6602-6-git-send-email-gene.chen.richtek@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org



On 21/12/2020 11:45, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
[...]
> +
> +static const struct of_device_id __maybe_unused mt6360_led_of_id[] = {
> +	{ .compatible = "mediatek,mt6360-led", },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, mt6360_led_of_id);
> +

I think we should fix MFD code to not need to use a DT binding here. See [1].

Regards,
Matthias

[1] https://lore.kernel.org/linux-mediatek/20210111164118.GE4728@sirena.org.uk/


> +static struct platform_driver mt6360_led_driver = {
> +	.driver = {
> +		.name = "mt6360-led",
> +		.of_match_table = mt6360_led_of_id,
> +	},
> +	.probe = mt6360_led_probe,
> +	.remove = mt6360_led_remove,
> +};
> +module_platform_driver(mt6360_led_driver);
> +
> +MODULE_AUTHOR("Gene Chen <gene_chen@richtek.com>");
> +MODULE_DESCRIPTION("MT6360 LED Driver");
> +MODULE_LICENSE("GPL v2");
> 
