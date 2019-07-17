Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B7E66C30D
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jul 2019 00:19:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727543AbfGQWTT (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 17 Jul 2019 18:19:19 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:38259 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727468AbfGQWTT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 17 Jul 2019 18:19:19 -0400
Received: by mail-wm1-f67.google.com with SMTP id s15so2251943wmj.3
        for <linux-leds@vger.kernel.org>; Wed, 17 Jul 2019 15:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/oBUNrgwhzcJhSx6lVwPUhpQkHchRg8ZoZ3xDXQySR4=;
        b=tf+rMFYshF6SzW64ya2C51NXlcfCL7H0z81Uz923BP/SUYyJP+51KMe1MzfkwrmDKq
         LFiCPPaIlysRFcGift9Na999anOGqFPuM2g6XMrX2XrtXZCHcPuWGTesHm+EYbt91jEA
         ur6kjuz5eTNqjHngEV9kHFnX8A5QcklAb4Pt5u4D8CjCyFLFchWHQruMftC3ei6IyYl9
         PUY6tStULCx8sQVqOHvdEOg7A+DOMJnQwSeYEhRjxHLgX8hVo9JRGXcmHRncToq+xmMd
         azEy+Uui/wWthlWHBk5RGRFr0SuIfZbVJV1SORlYmwSqNS5EzJXXKKNq751Ez8Hm1XX5
         bVcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=/oBUNrgwhzcJhSx6lVwPUhpQkHchRg8ZoZ3xDXQySR4=;
        b=nXC452ytASKNNLWZi4j5SLwsl+5OX+8K19kSy1bgIdgB9RaoId9Pw0S1MpvKl+03Cw
         aU7tL11lq+qkFH5nsg54c+UHW7i4OY4fDhj/VBTSArn0PNfWOcrheqQQZCmeYZLprPr8
         LpEKEl09lMq4eBhT+4MdZ/CCAb5VikA3YHHuhdvgrdDmump8v1J/liMJaaDJBPg/5Aol
         kMXRFziWpxJJMPfw2QzfbViuTQYC+IEMG0Ve/xDVl3J18yDSYr/mKR+6qsXRTeEgr9hJ
         2IPSHuVFLJC5Zz5LpVxHnPhg1MTeob78W0oWip5aGX5lc12vQlDzzmUutEDS0ufL9JmM
         8QsA==
X-Gm-Message-State: APjAAAVFQKxcdGco9ZXpTIDTSzLRBEvXng9zK1BGEFkonq2aDFvfkspY
        zQy6FDx6PwTVr7FH0cjiKLBf4D1K
X-Google-Smtp-Source: APXvYqzE25zOhgDUOOGqVkq4OewEy4WtlvUG9ghRA1Q81ctTMcDr9eoRevrADx/d3ar3hwd2mzYBhA==
X-Received: by 2002:a1c:4d05:: with SMTP id o5mr37964058wmh.63.1563401956804;
        Wed, 17 Jul 2019 15:19:16 -0700 (PDT)
Received: from [192.168.1.19] (bgq113.neoplus.adsl.tpnet.pl. [83.28.80.113])
        by smtp.gmail.com with ESMTPSA id t185sm18909522wma.11.2019.07.17.15.19.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Jul 2019 15:19:16 -0700 (PDT)
Subject: Re: [PATCH 1/1] leds: leds-lp5562 allow firmware files up to the
 maximum length
To:     Nick Stoughton <nstoughton@logitech.com>,
        linux-leds@vger.kernel.org
References: <20190717215606.3053-1-nstoughton@logitech.com>
 <20190717215606.3053-2-nstoughton@logitech.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 mQINBFWjfaEBEADd66EQbd6yd8YjG0kbEDT2QIkx8C7BqMXR8AdmA1OMApbfSvEZFT1D/ECR
 eWFBS8XtApKQx1xAs1j5z70k3zebk2eeNs5ahxi6vM4Qh89vBM46biSKeeX5fLcv7asmGb/a
 FnHPAfQaKFyG/Bj9V+//ef67hpjJWR3s74C6LZCFLcbZM0z/wTH+baA5Jwcnqr4h/ygosvhP
 X3gkRzJLSFYekmEv+WHieeKXLrJdsUPUvPJTZtvi3ELUxHNOZwX2oRJStWpmL2QGMwPokRNQ
 29GvnueQdQrIl2ylhul6TSrClMrKZqOajDFng7TLgvNfyVZE8WQwmrkTrdzBLfu3kScjE14Q
 Volq8OtQpTsw5570D4plVKh2ahlhrwXdneSot0STk9Dh1grEB/Jfw8dknvqkdjALUrrM45eF
 FM4FSMxIlNV8WxueHDss9vXRbCUxzGw37Ck9JWYo0EpcpcvwPf33yntYCbnt+RQRjv7vy3w5
 osVwRR4hpbL/fWt1AnZ+RvbP4kYSptOCPQ+Pp1tCw16BOaPjtlqSTcrlD2fo2IbaB5D21SUa
 IsdZ/XkD+V2S9jCrN1yyK2iKgxtDoUkWiqlfRgH2Ep1tZtb4NLF/S0oCr7rNLO7WbqLZQh1q
 ShfZR16h7YW//1/NFwnyCVaG1CP/L/io719dPWgEd/sVSKT2TwARAQABtC1KYWNlayBBbmFz
 emV3c2tpIDxqYWNlay5hbmFzemV3c2tpQGdtYWlsLmNvbT6JAj4EEwEIACgCGwMHCwkIBwMC
 AQYVCAIJCgsDFgIBAh4BAheABQJVo39tBQkJZgNMAAoJEL1qUBy3i3wmxLQQAK8QEQ0JqZEv
 5hrxiwT+Qtkx1TULYriK9sYcY9zbi18YxbKB0C4Znh5iP5o7k26WnPGLM+w4qWvTAkHjuAI7
 aBrvb4nGRvE5s14PQ9IHgL7iL3zAAHT1azIZng9dUCCSontB+vQZu1x/Un0lVlVCvsvO7QVt
 hAZUlT3iucNMO0jpCiS3raZkNfab8M+JWP/iplaV0Kn+O7LX3A/RdLmx5ZhuT+zvyHwl2c3K
 T56UHaQnjkuHB2Ytk8HtOjNXGNYnm4nLx3ok3jEN1nWDRV/DeiPn8zz4Zebsp686OH9vvX/0
 R4dk2YEjUCY/S7CbJxXzUnLjboUAGmtTVOu/uJ7y11iS9XEoJ09HEzijQwWctJXLojcTXCFw
 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
 eGGiEQ==
Message-ID: <f1370375-2049-2f10-8e49-6fd203fe8b29@gmail.com>
Date:   Thu, 18 Jul 2019 00:19:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190717215606.3053-2-nstoughton@logitech.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Nick,

Thank you for the update. Now it applies cleanly.

On 7/17/19 11:56 PM, Nick Stoughton wrote:
> Firmware files are in ASCII, using 2 hex characters per byte. The
> maximum length of a firmware string is therefore
> 
> 16 (commands) * 2 (bytes per command) * 2 (characters per byte) = 64
> 
> Signed-off-by: Nick Stoughton <nstoughton@logitech.com>
> ---
>  drivers/leds/leds-lp5562.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/leds-lp5562.c b/drivers/leds/leds-lp5562.c
> index 37632fc63741..e00117e3b50d 100644
> --- a/drivers/leds/leds-lp5562.c
> +++ b/drivers/leds/leds-lp5562.c
> @@ -260,7 +260,11 @@ static void lp5562_firmware_loaded(struct lp55xx_chip *chip)
>  {
>  	const struct firmware *fw = chip->fw;
>  
> -	if (fw->size > LP5562_PROGRAM_LENGTH) {
> +        /*
> +         * the firmware is encoded in ascii hex character, with 2 chars
> +         * per byte
> +         */

If you used scripts/checkpatch.pl on this patch then you would
notice some problems here. I fixed them up by myself.

Added also the tag to the commit message:

Fixes: ff45262a85db ("leds: add new LP5562 LED driver")

and applied.

Thanks.

> +	if (fw->size > (LP5562_PROGRAM_LENGTH * 2)) {
>  		dev_err(&chip->cl->dev, "firmware data size overflow: %zu\n",
>  			fw->size);
>  		return;
> 

-- 
Best regards,
Jacek Anaszewski
