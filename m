Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 811D3747DFC
	for <lists+linux-leds@lfdr.de>; Wed,  5 Jul 2023 09:11:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232135AbjGEHLv (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 5 Jul 2023 03:11:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231846AbjGEHLu (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 5 Jul 2023 03:11:50 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B6D71A1
        for <linux-leds@vger.kernel.org>; Wed,  5 Jul 2023 00:11:49 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-51de841a727so6770669a12.3
        for <linux-leds@vger.kernel.org>; Wed, 05 Jul 2023 00:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688541108; x=1691133108;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WX0WQA8HY3Ymz7UH7Yi3Ieb+P0qOXYqrfKwH/sPJabs=;
        b=P0JOrfTD0q7ZHjY5IOju9DyPynfZK6LfPQ72KB/m00RTGvWkPesx2OKB/jZgHugBkB
         QVeme2IiJ5n9GW+8xLwh8vU+UJy7xHY4w3rtTk+YvQnBWxANlXkEdBx8bMZsWvIS7MCI
         U4UCyDwn8G5FI13IlIDN5lMZVBREdIZmcPPhvfwFZYSzuErqQhdjvGILLBBUsJ1IePSk
         jpqsez32AaVjSkAZizs+NmDP4z7EeISbgQRvaRyTJ4i/DyHeBPKYI38KWb76Xv9kLdoP
         KBRdkjmskKx1A8tzWLqYclk5w6SLYKg687/qQvOui0ItRD1v9UH5pWuEK34ZccmEQnVk
         aNdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688541108; x=1691133108;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WX0WQA8HY3Ymz7UH7Yi3Ieb+P0qOXYqrfKwH/sPJabs=;
        b=dIuIhhdAigrf2yYHXhH/UNhGyFZLEUayN6lc8Gm4Q/PAIrJFhDGHkzV2/+W0yBv180
         29ALC0f3Dm5IQfGkWiQycyHKpDN/KmMzoxz6BcKMgBz+aP4k6y/yIC5UdzZEjO7oCBkC
         B84vlBBA4oiVRRalgOGKRszIzu1kKrVt/gfeDL8YawUm7UuaV2KE8ZohxKogKb2cJyfM
         zi1hqt//QSEp/vPHt5eE/rjN+K5+Q94PXOZIYEqs8Qd+9o9zXyn6NfvBaN2h/ftJAI7s
         gVhIF3wR5MXB8J7P96v/FjGrDR20jRUq0XuWU9u8Mgo6uI5bEqJJzU6g8AlvngveSvnY
         L3AQ==
X-Gm-Message-State: ABy/qLa9jDrELFyHmKkSl8QkiW+qq3bQ/4Ae/bILq/jRSAPUi4HPscLh
        byNKv2hiebey7udPDxlOHMWJXA==
X-Google-Smtp-Source: APBJJlHOsPDM5DNg9y1IPD7Tqyg5hcpZ5XP4/BQMReGoYnghFMp8qzeO0uyGvCySn5432Yyb1XldGA==
X-Received: by 2002:aa7:c544:0:b0:51d:ec12:32f8 with SMTP id s4-20020aa7c544000000b0051dec1232f8mr10241219edr.40.1688541107574;
        Wed, 05 Jul 2023 00:11:47 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id ca9-20020aa7cd69000000b0051dad094faasm9354972edb.36.2023.07.05.00.11.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jul 2023 00:11:47 -0700 (PDT)
Message-ID: <596e25d8-2e8b-8d6b-b6b8-9b56b58602bd@linaro.org>
Date:   Wed, 5 Jul 2023 09:11:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 2/2] leds: pca995x: Add support for PCA995X chips
Content-Language: en-US
To:     Marek Vasut <marex@denx.de>, linux-leds@vger.kernel.org
Cc:     Isai Gaspar <isaiezequiel.gaspar@nxp.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
References: <20230705000407.153005-1-marex@denx.de>
 <20230705000407.153005-2-marex@denx.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230705000407.153005-2-marex@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 05/07/2023 02:04, Marek Vasut wrote:
> From: Isai Gaspar <isaiezequiel.gaspar@nxp.com>
> 
> The PCA995x chips are I2C controlled LED drivers. Each chip has
> up to 16 outputs, each one with an individual 8-bit resolution
> PWM for brightness control.
> 
> Signed-off-by: Isai Gaspar <isaiezequiel.gaspar@nxp.com>
> Signed-off-by: Marek Vasut <marex@denx.de> # Basically rewrite the driver

...

> +
> +static struct i2c_driver pca995x_driver = {
> +	.driver = {
> +		.name = "leds-pca995x",
> +		.owner = THIS_MODULE,
> +		.of_match_table = of_match_ptr(pca995x_of_match),

Drop of_match_ptr(), it will cause warnings and is not really helpful.

Best regards,
Krzysztof

