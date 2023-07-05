Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80696748A15
	for <lists+linux-leds@lfdr.de>; Wed,  5 Jul 2023 19:26:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231821AbjGER0I (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 5 Jul 2023 13:26:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232586AbjGER0H (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 5 Jul 2023 13:26:07 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D04A4183;
        Wed,  5 Jul 2023 10:26:05 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 0843C863C7;
        Wed,  5 Jul 2023 19:26:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1688577963;
        bh=lYbl+cq3AKhxM9YfSDlOdLH7jnCpq6AIQHTFfd0Z9SU=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=Ai5bGxCQWLs7Gbp8Zi15ItqOnYB3rF9RUZbhgAtd0rLCZ9PZNCT4UGcTLlG6MlpB8
         ls1TFjucQ94BPFWxgF6YCbQmjNOn7+WsUPcB8pZHuDMsK6fbUwnc8iLKY6xAytw5QK
         Ci8KbmRg3PgyJhO020hmgg+f7OdJ4LMcw7ZDIeafMubYQgkJzDqDM76KYud5qQQ61G
         aJ/+Te2oSE0zVfirxGxWLnF3uQSRUfmpC/dK3V9CDUjWiJjiUHOiREk8nBAoYWVvaL
         joZ3IT9qQxHK0tZxOeyfcpP/GO55+UUJJa0BjjYgTaFqrtTvOb2L6FrQhB/WrQy8/t
         sRVxwhBiySYSQ==
Message-ID: <87ee247f-c39c-aeb6-fa3a-e3c933e5c117@denx.de>
Date:   Wed, 5 Jul 2023 19:26:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 2/2] leds: pca995x: Add support for PCA995X chips
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-leds@vger.kernel.org
Cc:     Isai Gaspar <isaiezequiel.gaspar@nxp.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
References: <20230705000407.153005-1-marex@denx.de>
 <20230705000407.153005-2-marex@denx.de>
 <596e25d8-2e8b-8d6b-b6b8-9b56b58602bd@linaro.org>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <596e25d8-2e8b-8d6b-b6b8-9b56b58602bd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 7/5/23 09:11, Krzysztof Kozlowski wrote:
> On 05/07/2023 02:04, Marek Vasut wrote:
>> From: Isai Gaspar <isaiezequiel.gaspar@nxp.com>
>>
>> The PCA995x chips are I2C controlled LED drivers. Each chip has
>> up to 16 outputs, each one with an individual 8-bit resolution
>> PWM for brightness control.
>>
>> Signed-off-by: Isai Gaspar <isaiezequiel.gaspar@nxp.com>
>> Signed-off-by: Marek Vasut <marex@denx.de> # Basically rewrite the driver
> 
> ...
> 
>> +
>> +static struct i2c_driver pca995x_driver = {
>> +	.driver = {
>> +		.name = "leds-pca995x",
>> +		.owner = THIS_MODULE,
>> +		.of_match_table = of_match_ptr(pca995x_of_match),
> 
> Drop of_match_ptr(), it will cause warnings and is not really helpful.

Will do , thanks.

I'll wait for the bindings review before sending V3.
