Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BD7C2F092E
	for <lists+linux-leds@lfdr.de>; Sun, 10 Jan 2021 20:04:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726525AbhAJTEG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 10 Jan 2021 14:04:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726346AbhAJTEG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 10 Jan 2021 14:04:06 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFA90C06179F;
        Sun, 10 Jan 2021 11:03:25 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id 91so14228895wrj.7;
        Sun, 10 Jan 2021 11:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=L8k5aeDhAQrJYcZuSR4844j89rsZ2Gq0oMvYHXzyAGY=;
        b=jk+uq0AiDRdiNEnkM7FW6/atgcpdxjIemHB7pOgGoyLVZ0TyvE0Ky380H+GQrDvACi
         bTgBBIKOCXKoNmMMgVUSvzK2jTUd8a9rwh5O2eLa+YCTAY0ZdeyEm+F+SZNmfLAFolGh
         XiMWEB4cZ7qbUOgmlUOiYS9gH2Hheh9ylNyag2DCJVfUfPQP7Yc2lobtc3Ih5UbKkYOB
         BLwWiAIBiXNGJ4hkROlBrb3ynv0LO9YXhK/CjnkUydGP3kgKWFDxrLLkIQEiqfGuJXpz
         CEKYNN7TCMra66BnaFLoGLi4YtL/Uaaqq40XlJeZTUw6v1tcY+EcBykhyLtz/UR+0khK
         qbdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=L8k5aeDhAQrJYcZuSR4844j89rsZ2Gq0oMvYHXzyAGY=;
        b=KP3Etqo4fTpnoQOuhMT9SQobJuZJzJkUKa86EJxlQlXjvdyy+my6M9rvOKYBa6UuV+
         7uyTaElqJKnPuNcW/HyNqlcOtacjhvDt3aeZSVgmoj0aTejUHKcsS2qVejA1yAlnoD6D
         wC4iY+dHoL/fClm6DwTvIWalNvjbtQ3dncGws3a4iKd70bBFeMvusLlVQT6H5ee1nKaQ
         Bg9K9H0WOlPSQfrUOsQElribDzgLezYMdkmIwqZArg0dJOOn6QNiZfaB2/9B+7/wYXpa
         9r7388wZrjrjbL+4oBNdEBHAAmndK5WlP+zdMMq4+aV1Ix28GOFkuDmwhjkT762Ek+Rd
         J8sQ==
X-Gm-Message-State: AOAM531CWEVNkMgzcDaqq79Hq6P3u4r07/wSvUTrbwqeyxLP4Om4SVoU
        heZPb6U24ifr2gQGGwN1ZDE=
X-Google-Smtp-Source: ABdhPJyi0WFtw4lD9yCsj0myeC2UeTnAxwmQG0VdV3WIw/TjKxtVrSCOUtB1BlOPHnP+Pbg8SsyF1Q==
X-Received: by 2002:adf:8b15:: with SMTP id n21mr12862781wra.426.1610305404770;
        Sun, 10 Jan 2021 11:03:24 -0800 (PST)
Received: from ?IPv6:2a01:110f:b59:fd00:94a0:8ae1:f9f5:9c8e? ([2a01:110f:b59:fd00:94a0:8ae1:f9f5:9c8e])
        by smtp.gmail.com with ESMTPSA id b14sm21243092wrx.77.2021.01.10.11.03.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Jan 2021 11:03:24 -0800 (PST)
Subject: Re: [PATCH resend v13 5/5] leds: mt6360: Add LED driver for MT6360
To:     Gene Chen <gene.chen.richtek@gmail.com>, pavel@ucw.cz,
        robh+dt@kernel.org, matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
References: <1608774440-21655-1-git-send-email-gene.chen.richtek@gmail.com>
 <1608774440-21655-6-git-send-email-gene.chen.richtek@gmail.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <468f24b7-0b00-9d54-32b7-92355cf7b7fc@gmail.com>
Date:   Sun, 10 Jan 2021 20:03:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1608774440-21655-6-git-send-email-gene.chen.richtek@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Gene,

On 12/24/20 2:47 AM, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> Add MT6360 LED driver include 2-channel Flash LED with torch/strobe mode,
> 3-channel RGB LED support Register/Flash/Breath Mode, and 1-channel for
> moonlight LED.
> 

You can carry my ack also for patches 4/5 and 5/5:

Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
Best regards,
Jacek Anaszewski
