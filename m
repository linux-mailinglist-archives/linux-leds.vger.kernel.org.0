Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44D851F1FB6
	for <lists+linux-leds@lfdr.de>; Mon,  8 Jun 2020 21:27:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726412AbgFHT1A (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 8 Jun 2020 15:27:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726410AbgFHT07 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 8 Jun 2020 15:26:59 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 840E1C08C5C2;
        Mon,  8 Jun 2020 12:26:59 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id l27so19666331ejc.1;
        Mon, 08 Jun 2020 12:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=D7Eyh5N8pfz8EauteHf9HhIuXtnavNBLFRX9oAYhLG4=;
        b=Lvo87ggH0byI+EyFYeL9exdQR3LbVzsKH2h6PmUE+rmE+0e3M4YgFFl8VPqazKK0Y5
         QHLle9/lo+oVZE8TnMD5Rrags132AHtHfLtuR8qSg4uR89DQ0wvk3RkNqFuOiRBp5vdL
         e24zTkTdY8ypHG+/PdnOZAdS9/Er1utyS6kXgMlX2lczE7rhHQ/c/Dmy/GKmJOGJ/ZH6
         ka+2UIz6KzumGzc5aVK3hQh1bMyyBLY3ojk/v1k7D4KzA2HQHtwt3KbZTtPKMACg+UJn
         lD7GCJu+P1FPiMlRDTByodK46ElqiXysoOuqK1baFqbjsnhgWkwGU9Ua1kYaHL/m3rS8
         AV/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=D7Eyh5N8pfz8EauteHf9HhIuXtnavNBLFRX9oAYhLG4=;
        b=hHy8ezfIxxKu7xiojpxIRqtO0on1vVduYj3hWIDCvpt+1pUacaMAZab6EZ7qFz+IQm
         GoACsdiy3fYrbyKuvYdVRrAYc0NxVIuHH+Qv9+UDRbwfbishvtplAbS/5rzYW60Z1MSs
         Be9+tAwWf+5QcHWziPmOoxuC8h/OF4CG1PDMXq6xEnVGII0VrC606/vvjlqe19xev1uk
         0pWpV10dzhxjyc6MV3r/S6zuuN3uOHUaiDTk8reu5iO68cPGrzEdnlsPz+JhsNwxA2BM
         Dy2hWtkTF+bp9X+QQi7kdvFXGVuF9bZPFcuprJ8itimZJHhSpZi1HgZV617XjZd9y82X
         B1dw==
X-Gm-Message-State: AOAM530IWkcN40yuo/NFA2KNRMC6244qws8brj4Ii4VCNFWMm6L8xio9
        J07p14k+FWk92CCKNPYpwsM=
X-Google-Smtp-Source: ABdhPJzKdGR87+lnaQjbSaNUsM9U4WQQgOWNUnvPSebnC0vCrDe0wbhkME+OG2sOJY0cWuAAYJvXTA==
X-Received: by 2002:a17:907:42d5:: with SMTP id ng5mr22394995ejb.164.1591644418324;
        Mon, 08 Jun 2020 12:26:58 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:3c4b:24e0:3c3a:dc89? ([2a01:110f:b59:fd00:3c4b:24e0:3c3a:dc89])
        by smtp.gmail.com with ESMTPSA id p13sm13051946edq.50.2020.06.08.12.26.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2020 12:26:57 -0700 (PDT)
Subject: Re: [PATCH v3 2/3] leds: pwm: add support for default-state device
 property
To:     Denis Osterland-Heim <denis.osterland@diehl.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "dmurphy@ti.com" <dmurphy@ti.com>, "pavel@ucw.cz" <pavel@ucw.cz>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>
References: <20200316124851.6303-1-Denis.Osterland@diehl.com>
 <20200316124851.6303-3-Denis.Osterland@diehl.com>
 <bee4d31f-1f00-c621-f93c-f49207e406d6@gmail.com>
 <e2835f58aead3ca85ad47e9769b393addcd19f2a.camel@diehl.com>
 <13d593fb-053e-c6de-3237-ec3b6d1c82c5@gmail.com>
 <278a6d81562d4642631fa003c59c4e4876050f54.camel@diehl.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <d1bfbe95-ca09-b1f4-0947-e06a7d29ef79@gmail.com>
Date:   Mon, 8 Jun 2020 21:26:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <278a6d81562d4642631fa003c59c4e4876050f54.camel@diehl.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Dennis,

On 6/8/20 8:32 AM, Denis Osterland-Heim wrote:
> Hi Jacek,
> 
> is your ack still valid for the new versions of the patch-set?
> Due to the changes I made, I am not sure.

Yes, you can keep it.

-- 
Best regards,
Jacek Anaszewski
