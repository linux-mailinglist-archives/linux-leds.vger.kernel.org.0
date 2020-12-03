Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8954F2CDFAB
	for <lists+linux-leds@lfdr.de>; Thu,  3 Dec 2020 21:26:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728950AbgLCUZX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 3 Dec 2020 15:25:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725885AbgLCUZX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 3 Dec 2020 15:25:23 -0500
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DD71C061A4F;
        Thu,  3 Dec 2020 12:24:42 -0800 (PST)
Received: by mail-ej1-x643.google.com with SMTP id qw4so5374729ejb.12;
        Thu, 03 Dec 2020 12:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WAMwGQJofZcxAkzkOGcHcKLf+ucZS6CWJ3WzoBEMmso=;
        b=VZr8zH5PzjZQU/7uboMkLfdntAYqEu8ZQXD7jgTo9VKJf9m3ehMTgwQG6ti5V4foGK
         ct1pHwR/cs8ocSH5tLC9y1DAvgDkUQmewpV8yX5ncBNSXoVbgR9/BsjelfhP/6rPjNtB
         S1YjFYe2fN6SUEIYc51QzvDPo4zSsD4DJWcleL+bhezem0soFIe1LnAz8baoEHH75hrD
         a2cPZ/jB/Gbp0uS+YMr4FliL2OQUo13gOs/5+XHRUcR30tWVTlXRgGzMHp1BaUI1plER
         qiHBoMTWlca2eK5GhEOB6yJVQsS0WNoKuX26vEakHxcEnVEsvSYTIcXnOhSj/Ds9jd/u
         EmwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WAMwGQJofZcxAkzkOGcHcKLf+ucZS6CWJ3WzoBEMmso=;
        b=CHMxdZb1s6liNc9GkhWPzI47UWIb/0rrhKsPvdGzfFLdM1/C3CK8mUNw+HDKrTQ4W5
         AeMYlYd4GNbYoCZh9mGt/AAzdiJRN8tkRKgZWcdVjgtKKFnV8OoqcoOfeHb/xH33vwtM
         FL469gXZnprGoQJ6laumoPQ+bwhg/Ff0vhoOyC5YVAZ5xlqBV85z+dBkUZNnEH3x6rxl
         4x6rmavksNTH/h2Ivt0KdqnV6E3YHagM+ceE5SGQD9oaRNsewYlnSnhllWDhdXg9US35
         2nC6ltYcohPKmYGwkBBDKKp+dCI1qQv6lqdupJUdMhyh7E5GRY4QKoYjoTmW/FgV0Pu+
         ZHJw==
X-Gm-Message-State: AOAM5301gJBljEbpy8pOEjSp1hjVcxE0NFxmgWG14IFfGi+f6bciGM1q
        cFCSxDtk1Igwwtj7FwvylIo=
X-Google-Smtp-Source: ABdhPJxozj0QaM9vnKJhVYPNhxjS2n2ZJ8JlOXZYHa24nHLU5Itc/+q+hxgVZXNeE5OygOJ7jtB8QQ==
X-Received: by 2002:a17:906:1cd4:: with SMTP id i20mr4170880ejh.415.1607027081299;
        Thu, 03 Dec 2020 12:24:41 -0800 (PST)
Received: from ?IPv6:2a01:110f:b59:fd00:2969:dca1:ffae:a9ff? ([2a01:110f:b59:fd00:2969:dca1:ffae:a9ff])
        by smtp.gmail.com with ESMTPSA id w3sm1942365edt.84.2020.12.03.12.24.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Dec 2020 12:24:40 -0800 (PST)
Subject: Re: [PATCH v11 4/5] dt-bindings: leds: Add bindings for MT6360 LED
To:     Gene Chen <gene.chen.richtek@gmail.com>, pavel@ucw.cz,
        robh+dt@kernel.org, matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
References: <1606906011-25633-1-git-send-email-gene.chen.richtek@gmail.com>
 <1606906011-25633-5-git-send-email-gene.chen.richtek@gmail.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <f9f3e471-8fbd-e8f9-31e9-2631703eda67@gmail.com>
Date:   Thu, 3 Dec 2020 21:24:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <1606906011-25633-5-git-send-email-gene.chen.richtek@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Gene,

Thanks for the update.

On 12/2/20 11:46 AM, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> Add bindings document for LED support on MT6360 PMIC
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> ---
>   .../devicetree/bindings/leds/leds-mt6360.yaml      | 159 +++++++++++++++++++++
>   1 file changed, 159 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/leds/leds-mt6360.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-mt6360.yaml b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
> new file mode 100644
> index 0000000..73c67b1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml

Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
Best regards,
Jacek Anaszewski
