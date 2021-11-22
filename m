Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11AC64596F5
	for <lists+linux-leds@lfdr.de>; Mon, 22 Nov 2021 22:51:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235987AbhKVVyX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 22 Nov 2021 16:54:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235323AbhKVVyX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 22 Nov 2021 16:54:23 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50983C061574;
        Mon, 22 Nov 2021 13:51:16 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id p18-20020a17090ad31200b001a78bb52876so376316pju.3;
        Mon, 22 Nov 2021 13:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=26gO4rRgJIBEdzZw2oVChYsgDct9/VSdGDhlMAGLtjI=;
        b=IkvHVxmDeCAsmUbQ25FnndY+L7HfxheUUHj+l+ty4yESlG9hMc5LxTC9T6MAj78j9o
         4UDiSEKtuA9WM+IBlvE3Ijnkui+2htIqQ+XIFbxOcv4nLfopC7U6aeykO0WGP2LL9n3h
         0Ux/WaF0vamZ/aIgWO1wP3O4a053z415+LOaOq1lCpy2oCbRJzQ71ZWPW6sbnMblbg4k
         DWF1oyn/bpx3bBm5YLv+IZXTbtzni4BwWcm6Z0XK6aaVMQtCmPRkOT7Ssm6RDSl+1rbf
         JlAQK4UZNlxrbp9QZJRulUFFfp/w/5jQYAAlclMK2EouKFLhqpsu14l9KxHtfGMYKyun
         sXbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=26gO4rRgJIBEdzZw2oVChYsgDct9/VSdGDhlMAGLtjI=;
        b=xQK35bJtN0lmyr3iqx/Q4fQPrUfvcMeAw8fikCLKju+vXEMPZ47hCoQTtrWUcXyqDs
         iQdafYg5en/s/j+387PC9VketMW5gSPX9jhSKHMrKCqZG17SuRB7ajPiqsXYzagVPLKE
         oGoS96sGQ8Ag+NE8oTOY7n9tc5QfzK8u6PVErLykzQbS3GEWMoJTaifeStgvB8YHAKMY
         4Yww2QAF/Orfar3z/2BMwZB2+MJYqSzvQYBZvqh0B57gh8JXg3G9+QHpnFdLBSPtMcri
         IJ1ufMQ1+8Dw0gzb52SXL+78Rkt2ijO9DmiBkz+q5j6rKKPywM1QehcNSrQ1mquW6Yun
         UcfA==
X-Gm-Message-State: AOAM531RPeDuOv30H1hUyW+V8wvYz0h7OrT1FFvFARc0S8IlwsTtH5VV
        Fu5CXurduOR2uB7TFTB/BVs=
X-Google-Smtp-Source: ABdhPJw4BGVSRa8DlvDnpA+bkr0fZ+DgZdHR07JVLNHw3veJoIGgAl1zYxY1F8ynQIq9/VRV9CImaA==
X-Received: by 2002:a17:90b:1643:: with SMTP id il3mr35040028pjb.182.1637617875873;
        Mon, 22 Nov 2021 13:51:15 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id fs21sm15728962pjb.1.2021.11.22.13.51.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Nov 2021 13:51:15 -0800 (PST)
Subject: Re: [PATCH 1/2] dt-bindings: leds: add Broadcom's BCM63xxx controller
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20211115091107.11737-1-zajec5@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <495a94ce-984e-f5c5-f5a2-74dc1b61e345@gmail.com>
Date:   Mon, 22 Nov 2021 13:51:12 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211115091107.11737-1-zajec5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 11/15/21 1:11 AM, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Broadcom used 2 LEDs hardware blocks for their BCM63xx SoCs:
> 1. Older one (BCM6318, BCM6328, BCM6362, BCM63268, BCM6838)
> 2. Newer one (BCM6848, BCM6858, BCM63138, BCM63148, BCM63381, BCM68360)

Just so the existing pattern/regexps continue to work, I would be naming
this "bcm63xx" to be consistent with the rest of existing code-base.
-- 
Florian
