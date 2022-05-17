Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 290A9529D90
	for <lists+linux-leds@lfdr.de>; Tue, 17 May 2022 11:12:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236859AbiEQJLt (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 17 May 2022 05:11:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244733AbiEQJLl (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 17 May 2022 05:11:41 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52CF82E699
        for <linux-leds@vger.kernel.org>; Tue, 17 May 2022 02:11:40 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id i19so33380675eja.11
        for <linux-leds@vger.kernel.org>; Tue, 17 May 2022 02:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=WoK3/4X38XI5MJwJfyYkHCDo2nAI1IwR+ig2OMpgJlE=;
        b=efY0hyThX5sR3+svG+5tVcQNYaM5+y3NBGW8jRjJgjjVQWxvwQYvqOz6sV6+QSbI9E
         EZn3NxDpNVdqW0VRIVgQ0DsJm2BdjGWB1w9VhDaNdqD1+hJ/wdtJ81SykfJcA/pwAqRB
         9oRMPbXuNDxi1EwhVxuj2u8i/EkZjNFHYPZ3OchBEwjNbwXU2TpWhMze82V7f2786ItS
         5gzo8b0bPpcRJelIr7PmBEYL+GYLgECadzFOSMJ/Nm3lYRQORvLYMAze7ro2xdSqX02t
         aY5NGQeQwwkt9eVmfzG9I36v2ew4j5jL05bOH0J/FTwKCojGvv2TxSBVHMu0uo4Upuld
         5HYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=WoK3/4X38XI5MJwJfyYkHCDo2nAI1IwR+ig2OMpgJlE=;
        b=6U1v0h4syaNQIxts7s0jqZ2pacjTn2YdK9Thqk3U43xAfk5u51L7fA6fcSf6y8Zuc5
         oic299ig7yKaqcc/aQFlVhaAF8LuFbYxsxvH30SLttWw1G9f78WTad+PHb/pQePNx+EU
         j2UdzcPB4BXTRmWmQV6psPgUGdUF5P7MvIY00viHv383OTLcyeWsOlwl+6IB7/DXHWKM
         ZkhZpZgaEJMFyntsb3BnFoLug4wlyx2E6t2OeDul+Dl6kzrIkHRiB3flNatUw0u478e/
         /3MvilIi57zmQqcz/jDoW1spd68UQHaO05+AyDAvYXwX8Bxnv2kpP95gH8JCcPMhmEjG
         wfDA==
X-Gm-Message-State: AOAM531YdJ0zO8FzC17dNZI9b35+9sc+BM1iCaFIfN4D69wQUI4NMlTW
        G4lAWRhxjB4v0xZDzCGm2crG3Q==
X-Google-Smtp-Source: ABdhPJzb8uTqg1GVyxA+vbN5JjvNR7xG9UeK+hy85pumHsYXVI1nJYVIRsbMxc46hDfQwWzLuPEMsA==
X-Received: by 2002:a17:906:559:b0:6f3:8ba6:39c8 with SMTP id k25-20020a170906055900b006f38ba639c8mr19009343eja.486.1652778698894;
        Tue, 17 May 2022 02:11:38 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id ec33-20020a0564020d6100b0042ab48ea729sm2736606edb.88.2022.05.17.02.11.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 May 2022 02:11:38 -0700 (PDT)
Message-ID: <178182e1-edd1-9f27-6441-a0a9fabde567@linaro.org>
Date:   Tue, 17 May 2022 11:11:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/2] leds: aw21024: Add support for Awinic's AW21024
Content-Language: en-US
To:     Kyle Swenson <kyle.swenson@est.tech>, pavel@ucw.cz,
        robh+dt@kernel.org, krzk+dt@kernel.org
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org
References: <20220513190409.3682501-1-kyle.swenson@est.tech>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220513190409.3682501-1-kyle.swenson@est.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 13/05/2022 21:04, Kyle Swenson wrote:
> The Awinic AW21024 LED controller is a 24-channel RGB LED controller.
> Each LED on the controller can be controlled individually or grouped
> with other LEDs on the controller to form a multi-color LED.  Arbitrary
> combinations of individual and grouped LED control should be possible.
> 
> Signed-off-by: Kyle Swenson <kyle.swenson@est.tech>

Thank you for your patch. There is something to discuss/improve.

> +
> +static const struct i2c_device_id aw21024_id[] = {
> +	{ "aw21024", 0 }, /* 24 Channel */
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, aw21024_id);
> +
> +static const struct of_device_id of_aw21024_leds_match[] = {
> +	{ .compatible = "awinic,aw21024", },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, of_aw21024_leds_match);
> +
> +static struct i2c_driver aw21024_driver = {
> +	.driver		= {
> +		.name	= "aw21024",
> +		.of_match_table = of_match_ptr(of_aw21024_leds_match),

of_match_ptr causes this being unused. kbuild robot probably pointed
this out... if not - of_match_ptr goes with maybe_unused. You need both
or none, depending on intended usage.

> +	},
> +	.probe_new		= aw21024_probe,
> +	.remove		= aw21024_remove,
> +	.id_table = aw21024_id,

Why other places are indented but this not?


> +};
> +module_i2c_driver(aw21024_driver);
> +
> +MODULE_AUTHOR("Kyle Swenson <kyle.swenson@est.tech>");
> +MODULE_DESCRIPTION("Awinic AW21024 LED driver");
> +MODULE_LICENSE("GPL");


Best regards,
Krzysztof
