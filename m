Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BA2B3AA090
	for <lists+linux-leds@lfdr.de>; Wed, 16 Jun 2021 17:58:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234552AbhFPP7h (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 16 Jun 2021 11:59:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234911AbhFPP7Q (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 16 Jun 2021 11:59:16 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B856C0611BC
        for <linux-leds@vger.kernel.org>; Wed, 16 Jun 2021 08:56:33 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id 93so2223449qtc.10
        for <linux-leds@vger.kernel.org>; Wed, 16 Jun 2021 08:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=60228.dev; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=mT3xVqTQA5S6m7lgQzvieq13V2/cXeSKnNcI26Ekn5s=;
        b=j9GkYE065Q0bgRR0p9CYGl+wvRj9nHZG8uCp8DUP/8WvlJLUT4k+rhwrkegz8s8TDy
         yyOAF/6Gf4i6I/XZmAS7qgNieIBg5UnTGnhm4Jw6dZjU9ryjS6BF9AQXp/KbzroltMSr
         Cqu09lA3wtl0Tsl04PFwkoCzMg2G85zIyGmTWeMk7QpipNzN0pwdP97TvCGHfZl7587+
         BpT5tg0OAqvaC/ujKeW3arFJYff/VyWyktTH/1fXw2L9wIEHu1LlINMtVvF7VbwY86eq
         nl8U+VOCC+Kn8iUkK2RK6VhilDf3WcK4M0ndQ92h2B34tmQdiWt2hE5pJERCn7V0/3X6
         078A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mT3xVqTQA5S6m7lgQzvieq13V2/cXeSKnNcI26Ekn5s=;
        b=c+vWU1QNFmPONNs/FT4H8YMoAF+e43SMyTfkxm4kQCpmesuXPCAKOFh+BBLZzTKS+q
         ulwGJ2MO7oWAhwVCGUWFaj9jGhq63C9CDxa+Fz44eatGyvXLw5GAJTEOwkGaAwkLWFDA
         jCztGDgKQuZzuiIgEURW113YQVOa+TyB39pugxO325MRGIP50+BhqcezJnOAJCnYQBqy
         wshyfw8u42W1DqRLEhVmF2E5c66jPoLb2BttwAJdHtKbNwfCUOzCP9fxzZ9tJ4jr+qQz
         S5BSOlYtRXIlaKswrWMQFOzjO6YWqGWwEDZHcBaOgxlyJd4ZqFTZjZ5tTvALWiO1pnYq
         duTQ==
X-Gm-Message-State: AOAM5327cGGH+cv9KrCuXhKjXK3kVWO/J/Ju7ZHgIQ1CYbjmgaiqX3Me
        mz/0OOEacczIQuC9o1JbjB5prPREsKTi3gnora91/A==
X-Google-Smtp-Source: ABdhPJyWBBd3ByhzqB9qk6kIIkwzkD1qQJurCTyXTuRLMsr2NH8P6SviIjVSFwzeN10jj9Ak8H5bQA==
X-Received: by 2002:ac8:7f88:: with SMTP id z8mr541976qtj.77.1623858992494;
        Wed, 16 Jun 2021 08:56:32 -0700 (PDT)
Received: from [192.168.1.107] (cpe-158-222-150-74.nyc.res.rr.com. [158.222.150.74])
        by smtp.gmail.com with ESMTPSA id k7sm1876908qke.65.2021.06.16.08.56.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jun 2021 08:56:32 -0700 (PDT)
Subject: Re: [PATCH v2] platform/x86: add support for Acer Predator LEDs
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        hdegoede@redhat.com, platform-driver-x86@vger.kernel.org,
        linux-leds@vger.kernel.org
References: <20210615221931.18148-1-leo@60228.dev>
 <20210616005147.26212-1-leo@60228.dev>
 <87e6f17f-3d82-ac63-b5eb-e7f3205f59e8@metux.net>
From:   leo60228 <leo@60228.dev>
Message-ID: <ae4e7db3-ffc5-b8f3-c08c-bba6882d44ad@60228.dev>
Date:   Wed, 16 Jun 2021 11:56:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <87e6f17f-3d82-ac63-b5eb-e7f3205f59e8@metux.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

> Can you please tell a bit more what these LEDs are actually used for ?
> Do they have some names or symbols ? Are they also controlled by
> something else (e.g. numlock or shiftlock leds)

They're used for the keyboard backlight. This functionality is pretty 
common on gaming laptops.
