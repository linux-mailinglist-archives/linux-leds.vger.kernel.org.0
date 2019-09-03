Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE17AA72CD
	for <lists+linux-leds@lfdr.de>; Tue,  3 Sep 2019 20:51:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725955AbfICSvk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 3 Sep 2019 14:51:40 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45169 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725883AbfICSvj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 3 Sep 2019 14:51:39 -0400
Received: by mail-wr1-f65.google.com with SMTP id l16so282380wrv.12;
        Tue, 03 Sep 2019 11:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=M49FXpPUxwjgm7t3Wg8oHOMmzMmjLMqZvhOGi0L5BtA=;
        b=OMXcLyANNe8Ie5TMqqTd10UfP6QPEWVHXvV4/K+9jinRSiTZLKb4re7W3YzRxdfaJ4
         GjUwEDIni9y3PXUUq7h6L2ohPAdZPawjH6OKYjCRS4qjSTrhv6HhteXLvbX7P9meLolT
         XCBwUJcC2BcmMIUnR3FZWd8rjc5olVESia+UeilKHBT4DovVUPUkEVq7n1XKliXmL6+x
         ewocFqRiZUXhvTJzkl0Y6Ha3+GRVCGfG3UrQrsO3U3rzAFu7tAn1STGlQ7be+omxpD1J
         ywnlBjdCGQtcLlF4EyHd7LaBMTEUabVcoR+QP0L0Sbryfw+sjGnKbroKKA1dy3/wbJKA
         DzFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=M49FXpPUxwjgm7t3Wg8oHOMmzMmjLMqZvhOGi0L5BtA=;
        b=sjnFu9OdJgdLr94THMvCb1scvcG7Zu44B41n218e0dJ3ejxao8+7W/ZbMDoExaKkx5
         rEa21P2ZbLiPG5AEFS22YX7yEs4Egxb5PcgHpItq6vcdgSpnnR9LcQeKOui/me1jboCc
         WTPSNFWdzUiideo7bAnDVcZopI9WkCIb3FiDvu0WrMf499wu9nqQUdjJdubK/d2CiWAa
         TPe9EPj+rpXeMcI4H7oyDiRS3kTxcpkCh7ehHX60Lx29Wty7Rr7b3/OlPSpcaEsBnsYk
         +xA3O3Ymgz+bNxzoMr+u7PscG8oziIEzTISF6gfQfrP27KizDatg1HqPOBjQojkRjarr
         03NQ==
X-Gm-Message-State: APjAAAXCcyg3MpD2+wkf7YR68c/XwbOthWYOGWfubVdv4r196hkKCHyi
        1TEv1o+7JXeXRDERw3vCJd9iVKmF
X-Google-Smtp-Source: APXvYqzaChP754b4O5iJUcZbrlTXxV51IGfsrUYx+Yf+KbFJv8eqhSlRfwccR8wdPbcn9wBsAnjNEA==
X-Received: by 2002:a5d:45c3:: with SMTP id b3mr24343528wrs.207.1567536696437;
        Tue, 03 Sep 2019 11:51:36 -0700 (PDT)
Received: from [192.168.1.19] (bkv132.neoplus.adsl.tpnet.pl. [83.28.189.132])
        by smtp.gmail.com with ESMTPSA id e13sm266388wmh.44.2019.09.03.11.51.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Sep 2019 11:51:35 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] leds: lm3532: Move static keyword to the front of
 declarations
To:     Krzysztof Wilczynski <kw@linux.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190830090958.27108-1-kw@linux.com>
 <20190830181104.5813-1-kw@linux.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <30443cb8-cd19-2b0e-7e11-2a272d000696@gmail.com>
Date:   Tue, 3 Sep 2019 20:51:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190830181104.5813-1-kw@linux.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Krzysztof,

Thank you for the patch set.

On 8/30/19 8:11 PM, Krzysztof Wilczynski wrote:
> Move the static keyword to the front of declarations ramp_table,
> als_avrg_table and als_imp_table, and resolve the following
> compiler warnings that can be seen when building with warnings
> enabled (W=1):
> 
> drivers/leds/leds-lm3532.c:209:1: warning:
> ‘static’ is not at beginning of declaration [-Wold-style-declaration]
> 
> drivers/leds/leds-lm3532.c:266:1: warning:
> ‘static’ is not at beginning of declaration [-Wold-style-declaration]
> 
> drivers/leds/leds-lm3532.c:281:1: warning:
> ‘static’ is not at beginning of declaration [-Wold-style-declaration]
> 
> Signed-off-by: Krzysztof Wilczynski <kw@linux.com>
> ---
> Related: https://lore.kernel.org/r/20190827233017.GK9987@google.com
> 
>  drivers/leds/leds-lm3532.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/leds/leds-lm3532.c b/drivers/leds/leds-lm3532.c
> index c5cfd8e3f15f..62ace6698d25 100644
> --- a/drivers/leds/leds-lm3532.c
> +++ b/drivers/leds/leds-lm3532.c
> @@ -208,7 +208,7 @@ static const struct regmap_config lm3532_regmap_config = {
>  	.cache_type = REGCACHE_FLAT,
>  };
>  
> -const static int als_imp_table[LM3532_NUM_IMP_VALS] = {37000, 18500, 12330,
> +static const int als_imp_table[LM3532_NUM_IMP_VALS] = {37000, 18500, 12330,
>  						       92500, 7400, 6170, 5290,
>  						       4630, 4110, 3700, 3360,
>  						       3080, 2850, 2640, 2440,
> @@ -265,7 +265,7 @@ static int lm3532_get_index(const int table[], int size, int value)
>  	return -EINVAL;
>  }
>  
> -const static int als_avrg_table[LM3532_NUM_AVG_VALS] = {17920, 35840, 71680,
> +static const int als_avrg_table[LM3532_NUM_AVG_VALS] = {17920, 35840, 71680,
>  							1433360, 286720, 573440,
>  							1146880, 2293760};
>  static int lm3532_get_als_avg_index(int avg_time)
> @@ -280,7 +280,7 @@ static int lm3532_get_als_avg_index(int avg_time)
>  				avg_time);
>  }
>  
> -const static int ramp_table[LM3532_NUM_RAMP_VALS] = { 8, 1024, 2048, 4096, 8192,
> +static const int ramp_table[LM3532_NUM_RAMP_VALS] = { 8, 1024, 2048, 4096, 8192,
>  						     16384, 32768, 65536};
>  static int lm3532_get_ramp_index(int ramp_time)
>  {
> 

Both 1/2 and 2/2 applied.

-- 
Best regards,
Jacek Anaszewski
