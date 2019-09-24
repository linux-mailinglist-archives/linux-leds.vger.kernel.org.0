Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A3D8BD1C0
	for <lists+linux-leds@lfdr.de>; Tue, 24 Sep 2019 20:21:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395207AbfIXSVE (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 24 Sep 2019 14:21:04 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40484 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394091AbfIXSVE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 24 Sep 2019 14:21:04 -0400
Received: by mail-wm1-f67.google.com with SMTP id b24so1083804wmj.5;
        Tue, 24 Sep 2019 11:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8DtjNvJI7omodXJqBEfDRZCHl5Fugn0TcO2cbrU+wn4=;
        b=RcyK6BcxL0dxXvpToQa8jJm+pm9K9G9UGc1Sl4LFEcpzkvIz4YpW0ysbWzivQvwu+2
         eaTITUfzKvo8XyYkx/JmYIShGDj16h9msYLSGgvQrUCEKCkPm8OLbxNICDvCrgrQ/CQZ
         Pnt8OC2CZClOAGFB0CSfB8SE4voxqw/PD73aC56CcQCdJvuKe8DEaV1EsuQZ7NsHEOzR
         6D1l/8s1yX5Q2lFWAlnEqi27hCMfoCr199KnR0sTsK+uz7CqqtqRxRLevIm7n6VGrymH
         8F4JtLAk6/iOMyhXd4SvBhRsztNe72oUEa5dqMm0F/l+TX0nSfWU/aDXZFZiD/w3v+U1
         0xUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=8DtjNvJI7omodXJqBEfDRZCHl5Fugn0TcO2cbrU+wn4=;
        b=jO5eIxYIoJP7mpB/Ucni/Ew4WjTfeZ/Kob3LnApVvm0qCaTF5exxf45NU/U1nfh0OF
         LQA3VDlJpR0dcObX6zKzatO+zT1M3ZMQ2yWF0T0xhN0PwtgN3GSF4EwnEKWREUgNCEkW
         3wPbU88pu8qQNWou0agMIGGXkb4uoUR8/AiyRD4YTLcwgQUJGSYXvdw7A1ElgdgkJ+iz
         /NYFDRQ9Jr1caYIQz97e7+faaKBtgYfat4CUxafGfGxJH9ZvIeCA5WRbmazeSHqLEaCs
         2Kr3BkwUVdx+xb7mw9ngtHC6aXR8qGfc6C3twBiuGCgT3/Wz76/jbod+09WsZuXxEdIq
         wtRQ==
X-Gm-Message-State: APjAAAXRMutnN+AUCIi4uQUcEftTwSFtEkqOOvycl961Me1NXkyMAzbw
        jPNqEBMeTR7p0YUfARku7EWAZAbN
X-Google-Smtp-Source: APXvYqxKPeFgWHRPzP/Gtopti8ePk45sqqlJI4YJoo9LRozvi6ODz1pEqi1qxACzCDdETJNA3D6wtQ==
X-Received: by 2002:a05:600c:351:: with SMTP id u17mr1553652wmd.1.1569349260879;
        Tue, 24 Sep 2019 11:21:00 -0700 (PDT)
Received: from [192.168.1.19] (bfw157.neoplus.adsl.tpnet.pl. [83.28.60.157])
        by smtp.gmail.com with ESMTPSA id p7sm376011wma.34.2019.09.24.11.20.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Sep 2019 11:21:00 -0700 (PDT)
Subject: Re: [PATCH v3 0/5] leds: lm3692x: Probing and flag fixes
To:     =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1569100154.git.agx@sigxcpu.org>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <ba610ed3-19b7-3e10-7032-453e0cb05704@gmail.com>
Date:   Tue, 24 Sep 2019 20:20:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <cover.1569100154.git.agx@sigxcpu.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Guido,

Thank you for the update.

On 9/21/19 11:12 PM, Guido Günther wrote:
> The driver currently returns success on init although probing fails and
> register setup uses flag values from other registers which is confusing when
> reading the driver. This series cleans this up.
> 
> Changes from v2:
> - Add Acked-by from Pavel Machek, thanks!
>   https://lore.kernel.org/linux-leds/20190920114743.GA21835@amd/
> - As per review comment from Dan Murphy
>   https://lore.kernel.org/linux-leds/2bde2870-08a3-38b9-9cd7-fee0e2107743@ti.com/
>   - rename return value from ret2 to reg_ret
>   - print error code
> 
> Changes from v1:
> - Add reviewed by's from Dan Murphy, thanks!
>   https://lore.kernel.org/linux-leds/cover.1568772964.git.agx@sigxcpu.org/T/#mc183f3f65931371fa9f9ca2e0e83e0b85010f24b
>   https://lore.kernel.org/linux-leds/cover.1568772964.git.agx@sigxcpu.org/T/#mb845fac36327a5d5dd03fe7e988eef0eb5626f82
>   https://lore.kernel.org/linux-leds/cover.1568772964.git.agx@sigxcpu.org/T/#m995bce73dda3e3bd4f0c2e8f98cbd04a39c13832
> - As per review comment from Dan Murphy
>   - Don't drop error message when disabling the regulator fails
>     https://lore.kernel.org/linux-leds/cover.1568772964.git.agx@sigxcpu.org/T/#m2ab6dc33b7277b71a197c3747847f1c4d9d9c1d8
>   - Handle -ENODEV (when the regulator is not set)
>     https://lore.kernel.org/linux-leds/cover.1568772964.git.agx@sigxcpu.org/T/#mf6212c29bbfa37b43200ea2c9744074de4f068ee
> - Add Acked-by from Pavel Machek, thanks!
>   https://lore.kernel.org/linux-leds/20190919095415.GA29939@amd/
> 
> Guido Günther (5):
>   leds: lm3692x: Print error value on dev_err
>   leds: lm3692x: Don't overwrite return value in error path
>   leds: lm3692x: Handle failure to probe the regulator
>   leds: lm3692x: Use flags from LM3692X_BOOST_CTRL
>   leds: lm3692x: Use flags from LM3692X_BRT_CTRL
> 
>  drivers/leds/leds-lm3692x.c | 47 +++++++++++++++++++++++--------------
>  1 file changed, 30 insertions(+), 17 deletions(-)
> 

Patch set applied to the for-5.5 branch of linux-leds.git.

-- 
Best regards,
Jacek Anaszewski
