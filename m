Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EF91473BA0
	for <lists+linux-leds@lfdr.de>; Tue, 14 Dec 2021 04:41:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231773AbhLNDlL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 13 Dec 2021 22:41:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230147AbhLNDlL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 13 Dec 2021 22:41:11 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10D5DC061574;
        Mon, 13 Dec 2021 19:41:11 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id m24so12616291pls.10;
        Mon, 13 Dec 2021 19:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=98LjC0oWVBXU9u8pvXSFA1k0iwqQ0XVH3UAvDTfbXLU=;
        b=FiFWi8TgB6N5uUqGoWvzXjnGJqphkU3VWDrlfppMg76J8AyLop/yv59LdTcGkpT/Tp
         IoAwedEKp/N9svbr2NkTzBx2sBbCceuBVyokrS+fXgDRplgTDmi16Otlfss+bjlA+1nW
         nHe3b85/YSG0bH8dPFIsTU5Iq05LqYeslv7p1iPI25qeBVqhbyqbuSITQmPCW+n8ndo3
         uZj1PzoPWMInpe1duSMel0QUqp3GtqZzCoxWgqtW1jul5bKqh2pOol7GFDOE1guvMZmG
         I8kcDLXIsJ/Si5Ki4YYS7YLlZnv3LI+rLjJinniu6iAkUKPxdwi4RbGMBuYJbYhRFij3
         hIFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=98LjC0oWVBXU9u8pvXSFA1k0iwqQ0XVH3UAvDTfbXLU=;
        b=OcpCkd2IHVJU//6lPyPz4wNm8Mbo8sx+sePEaBhl2dj7keqeFynRn+4nal+6PmQFtn
         br8waTOrAsK2QvPNrbXsFGUVM5nMAXOV2C1OKg5xEWeVjFDMO3DomqwjFbgiNr76YRhd
         AZYDIO+c3Iqu+IsR6F5/O9AL4VBGH3aHJy0734QJ+SuA76RTqoOHklUZuCFDFKZdEfzN
         S1MNlCu2ZMAGaBBoAbUhjn+KBGf/01ZK80JTRrmLlWzZnpRunz6AFMkqqZlDKSq7fZBm
         QMzw0mSK1geoYsJlZ3SyVcByAQ6eV77bkgN92WhuBO3NLrLfwbiJHK86qHTwgebCY64P
         Y+Wg==
X-Gm-Message-State: AOAM532y6B6jtNSK6VhJdPMScz6g8dtYq2vqIKHv5oT5uJbymGMmtPQc
        ajPxuiC7znp+M4u2sDadjjc=
X-Google-Smtp-Source: ABdhPJwjlq+8gl4jriNwRBSaLi3p9G+bvsa4TfgM7aQ5aex5F2E4a7b27hRuWoK654+LhxFAvgGdCA==
X-Received: by 2002:a17:902:e890:b0:142:f3:7bf7 with SMTP id w16-20020a170902e89000b0014200f37bf7mr2573158plg.87.1639453270581;
        Mon, 13 Dec 2021 19:41:10 -0800 (PST)
Received: from [192.168.1.3] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
        by smtp.gmail.com with ESMTPSA id f8sm14073410pfv.135.2021.12.13.19.41.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Dec 2021 19:41:10 -0800 (PST)
Message-ID: <0973244c-1b17-e3af-3e7c-7b61bd8f6488@gmail.com>
Date:   Mon, 13 Dec 2021 19:41:08 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH V2 2/2] leds: bcm63xxx: add support for BCM63138
 controller
Content-Language: en-US
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20211124111952.22419-1-zajec5@gmail.com>
 <20211124111952.22419-2-zajec5@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20211124111952.22419-2-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org



On 11/24/2021 3:19 AM, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> It's a new controller first introduced in BCM63138 SoC. Later it was
> also used in BCM4908, some BCM68xx and some BCM63xxx SoCs.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
