Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A2DB400D12
	for <lists+linux-leds@lfdr.de>; Sat,  4 Sep 2021 23:30:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234283AbhIDV3w (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 4 Sep 2021 17:29:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234174AbhIDV3w (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 4 Sep 2021 17:29:52 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3378C061575;
        Sat,  4 Sep 2021 14:28:49 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id c42-20020a05683034aa00b0051f4b99c40cso3596992otu.0;
        Sat, 04 Sep 2021 14:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Kvs10M8hVqAwFmeq5017Z2qldi6b/B7kf0yiZ5Tv2FM=;
        b=UiqvVBTIguqSmIB6xkxgwrtcdvca+48d9G4ORYmEUKX70BkqR0gHgcikLh2i/UvqMl
         S4nGbg9WLqo8EnJYS9ZG3Ui/+cGbzGfnqVQG/lpCi+cdD8u4exLEAXLl53nXSqw+zF4f
         JGLrGzt5oHi8064GLNWJZlCqCPc2NYvwXYUoe7M8jAWr+UFUinO/pRaGZOImKEQcbvNk
         CzcWdWXDXDZnRP2QX9B7E92PTXC7Ut7OblXfX45p3kqpPgSr+R1YJzomg3UGAwV0WduW
         Zkx7+TGKHcs+AZ/tiRKD2MxDwqUoL3jt5o+03oRjWuUTZbMrZDeoWKYKuEeEGMrasbIS
         nZBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Kvs10M8hVqAwFmeq5017Z2qldi6b/B7kf0yiZ5Tv2FM=;
        b=KBJdc1QDhDbVJCCEOJH19qa51IrPEbc01PdVGuOfV64AeNUw99I8M83KXnEd1N7p43
         +Cca7lvhqoXJZGohFAKGrC6gJJ5rS+8wetLd+OfnCD9gIiZ9n0W2EW4RZNK06iQ2r0ZT
         NGE3tj9Tms6Ylmxrc4nkhkBpofiPwmU8mPxD0o1ryeXW4uDLm6J7AJoqp6aIxngmES93
         Ck7v6jqB19OfyesTmJ9pJrMf2QDVZAe8z1GIf4XJtS4R/wzvbiNQSziFm+IVpru4gHSt
         hC54DW7t5zSacIyReaxfjdB/FmGbPx5/oBPWwKdM3+QG4bgoeo5ZSeYq3SUzUGJcqGuv
         rHFw==
X-Gm-Message-State: AOAM531hpCHrGDBC2i4P+SgJVmHZhe432HluNNtQ5jAnYBATIbOL0lo9
        8L+8ERnkl4lYNPVBoA9f3Okpa/YzGHopLQ==
X-Google-Smtp-Source: ABdhPJySmNvP+IL1DP9xNMQcBBJFio+hEMxo0TSQf8LKW61TzbNLymMtdYib+vjUH6qHz5az7IurzQ==
X-Received: by 2002:a9d:798f:: with SMTP id h15mr4765118otm.227.1630790929303;
        Sat, 04 Sep 2021 14:28:49 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id g16sm748596otr.20.2021.09.04.14.28.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Sep 2021 14:28:48 -0700 (PDT)
Subject: Re: [PATCH 15/18] ledtrig-blkdev: Add sysfs attributes to [un]link
 LEDs & devices
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     axboe@kernel.dk, pavel@ucw.cz, linux-leds@vger.kernel.org,
        linux-block@vger.kernel.org, kabel@kernel.org
References: <20210903204548.2745354-1-arequipeno@gmail.com>
 <20210903204548.2745354-16-arequipeno@gmail.com> <YTMK2F664Gi+Xc3i@kroah.com>
From:   Ian Pilcher <arequipeno@gmail.com>
Message-ID: <85226c37-faa8-4d99-e5a7-e5eec0a0f642@gmail.com>
Date:   Sat, 4 Sep 2021 16:28:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YTMK2F664Gi+Xc3i@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 9/4/21 12:57 AM, Greg KH wrote:
> Where are the Documentation/ABI/ updates for these new sysfs files?

They're in Documentation/ABI/testing/sysfs-class-led-trigger-blkdev,
which is added in the first patch in the series.

-- 
========================================================================
                  In Soviet Russia, Google searches you!
========================================================================
