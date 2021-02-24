Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 778383241A2
	for <lists+linux-leds@lfdr.de>; Wed, 24 Feb 2021 17:07:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232394AbhBXQGc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 24 Feb 2021 11:06:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235930AbhBXPoR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 24 Feb 2021 10:44:17 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBB53C061788;
        Wed, 24 Feb 2021 07:43:33 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id q20so1557965pfu.8;
        Wed, 24 Feb 2021 07:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=F0KLBWS2W58C1mncZrZj6XYYjOTe4I0lLVbrvhxQFPg=;
        b=fsOnGihbrMnh4NyBcZ13Zfl9nPi7YXnNhk3S/hqMqdqz4gYhj6jdyZm5uxxkW2u10+
         6pqCnJo5SMazt8VR3WNcD7TBL9XxRDjQcIWsFI0CFJIE50d//08QNIfVUMTt75jlCbIZ
         9sUpj0C91gVJW9BKsjC8ekeNX0iyaxtQfTEl08X0ZfKWqKEVxZBpWYcrOtT/ogiiIxiB
         M6vPZbDgsIhgD7PTTFFXP16F8METL6oI1xZ9hFobLd7PaYkox7Q86WwPHGEUae7gkc4h
         AauLnnT/+C0qYcGcigWRRNmxMELpJ1zqQxKbqY7AJJEKGxYNwzIi3c3gGIjoF2dvJ2Th
         pZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=F0KLBWS2W58C1mncZrZj6XYYjOTe4I0lLVbrvhxQFPg=;
        b=JAV+ZxTCuOS4Q5Cj2v8EgQd+84tlc3UZGE/tkDZO/4mv/qYVRq9i5OVdZL3ItWRoJo
         /fuwHmHNsDkm1NetLiEzM8sNofNurvWP+visJRL05PD15j+7fZdPjHKaNkzVo2v8loSx
         4nKUZpf/V7IIJ8cPhFm9UbJjSRgGOT8zN/xnqdtZ/vNDFPFLDIRnS9jCCFDT1wGMI2OA
         0CbwM5gZ43R5y0o9Zj8tteRmptOLY7kAi1KyJFE/7EFNphFlVOaRRbYaq1CBbvgl+Vf5
         TykFnktOI71wuewiiGDQ3gI3b1IQ3Jpj1mqknMJNiK2kcj+fYaiZoiAAwReJw5KVI51j
         W7iQ==
X-Gm-Message-State: AOAM530yEAVPhNzDyBEGBdo9JQlbQKRCV6SEiILDs0SOnMJKSxmI/pBo
        AzKkA4jC98fWU4iKGotQK1EK8UWzIls=
X-Google-Smtp-Source: ABdhPJxMtFxXQUuJ/9tlIcKcRMqu9KbleLwHT7qmN8X4E2naDvc0VxxKFVLIipJsoz/NNiKhKtUo0g==
X-Received: by 2002:a63:ff53:: with SMTP id s19mr25935894pgk.347.1614181412804;
        Wed, 24 Feb 2021 07:43:32 -0800 (PST)
Received: from [10.230.29.30] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d24sm2779692pfr.139.2021.02.24.07.43.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Feb 2021 07:43:32 -0800 (PST)
Subject: Re: [PATCH v2 1/2] leds: bcm6328: improve write and read functions
To:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        jonas.gorski@gmail.com, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210224101110.20179-1-noltari@gmail.com>
 <20210224101110.20179-2-noltari@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <d920067d-3045-754a-c852-e1550311be9d@gmail.com>
Date:   Wed, 24 Feb 2021 07:43:30 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210224101110.20179-2-noltari@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org



On 2/24/2021 2:11 AM, Álvaro Fernández Rojas wrote:
> This is proven to work in BMIPS BE/LE and ARM BE/LE, as used in bcm2835-rng
> and bcmgenet drivers.
> Both should also be inline functions.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
