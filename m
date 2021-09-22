Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E1F8414A16
	for <lists+linux-leds@lfdr.de>; Wed, 22 Sep 2021 15:04:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230089AbhIVNGO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 22 Sep 2021 09:06:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230127AbhIVNGN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 Sep 2021 09:06:13 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97D95C061574
        for <linux-leds@vger.kernel.org>; Wed, 22 Sep 2021 06:04:43 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id q11so6527523wrr.9
        for <linux-leds@vger.kernel.org>; Wed, 22 Sep 2021 06:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=R31ccu0TqMlPUtNKv5VmcQXqknWHvbIakXTHd3Nf1E8=;
        b=tA4DSQblSR3RKPn+ISUdkVPmzNZzjCbkoIjpxxxIyLTpzAFYgN8HabuOWo/KW+q8km
         3BA/dG5HxKUerkwzoo3VTYqDPy2eM52AxioKrQAQoNuFGj/cqeR8uVwLgxR0dwygdocK
         0jjXFbCHxeeWhsZbgvAsFNdq/ikb8CBv4h1vSrVe4FnBVVFpFZppQkdelru3RUCc763/
         DLEktcOKr21OeD+Oj3nT2y3dx16lx8jz2YtLD3c39SaKHrjB955/lcFwgx1nxt9Y0r+v
         fkNTOy1So7xX3pstdfp6zv+tOCNrkr64EKAZXq5LTmfgAE1Pgbl4n5lTcQ16QsGADTO4
         /UPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=R31ccu0TqMlPUtNKv5VmcQXqknWHvbIakXTHd3Nf1E8=;
        b=w2iQp1nJHjKjbOetwEvcClqof/gt3Lr2qrxKVT2cofDbIbzFtnKqkAbGDxddDYSyCZ
         cI+fyN9WNzN6kUDfHUkhkaw7xdHikAwE0CW62cFswqTqIy9/RbqrtyLxjMDzLkFtLvgz
         Dzhf5Z71Ro+NVAj8ZWSv035rYw4AvCFMnJtl/3iLBlXEqRA4fZDkWdbsUUIW1mENOvV2
         N1ar1oA3P7A/DDDfdwgtyzeNJuH2qP18Z189tMkInDSPoFEGrW8f2g5zhFwItkxmDOa5
         Mdd4hpVuLTF0j9j9StJF8PFe8/Lv+IjP7lHxpBfKu2DMDSVVfgVjMrssH2Z22d28M/Hm
         xWoQ==
X-Gm-Message-State: AOAM531I4GXpYsV79HzxEf1OeyZxF1kfITat2TNY2c2yItibDP3dlqOZ
        nD+qwf8HNpCAfemvLgQ9c/9Pkw==
X-Google-Smtp-Source: ABdhPJx7nfxx48lTrlx0zSN6H1eWSFs448sEbZ0sH9EwWy9Cd3ht3NXMzXIEC1MB940/lPxUw1wAgQ==
X-Received: by 2002:a1c:f606:: with SMTP id w6mr10495911wmc.42.1632315882125;
        Wed, 22 Sep 2021 06:04:42 -0700 (PDT)
Received: from google.com ([95.148.6.233])
        by smtp.gmail.com with ESMTPSA id q3sm860236wmc.25.2021.09.22.06.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 06:04:41 -0700 (PDT)
Date:   Wed, 22 Sep 2021 14:04:39 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Luka Kovacic <luka.kovacic@sartura.hr>, linux-doc@vger.kernel.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        geert+renesas@glider.be, Max.Merchel@tq-group.com,
        linux@rempel-privat.de, daniel@0x0f.com, shawnguo@kernel.org,
        sam@ravnborg.org, arnd@arndb.de, krzysztof.kozlowski@canonical.com,
        pavo.banicevic@sartura.hr, corbet@lwn.net, pavel@ucw.cz,
        robh+dt@kernel.org, linux@roeck-us.net, jdelvare@suse.com,
        goran.medic@sartura.hr, luka.perkov@sartura.hr,
        robert.marko@sartura.hr
Subject: Re: [PATCH v9 2/7] drivers: mfd: Add a driver for IEI WT61P803
 PUZZLE MCU
Message-ID: <YUsp58sJATzVHrzn@google.com>
References: <20210824124438.14519-1-luka.kovacic@sartura.hr>
 <20210824124438.14519-3-luka.kovacic@sartura.hr>
 <YUsLfZrnX2hq4FGV@google.com>
 <YUsWjUWBwW8OYBAr@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YUsWjUWBwW8OYBAr@kroah.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, 22 Sep 2021, Greg KH wrote:

> On Wed, Sep 22, 2021 at 11:54:53AM +0100, Lee Jones wrote:
> > Greg,
> > 
> > Would you be kind enough to take a look at the SYS imp. please?
> 
> /me hands Lee some extra characters...

Fingers faster than brain!

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
