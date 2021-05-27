Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29D1A393388
	for <lists+linux-leds@lfdr.de>; Thu, 27 May 2021 18:19:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235522AbhE0QVM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 27 May 2021 12:21:12 -0400
Received: from relay07.th.seeweb.it ([5.144.164.168]:55805 "EHLO
        relay07.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234095AbhE0QVK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 27 May 2021 12:21:10 -0400
X-Greylist: delayed 574 seconds by postgrey-1.27 at vger.kernel.org; Thu, 27 May 2021 12:21:10 EDT
Received: from [192.168.1.101] (83.6.168.54.neoplus.adsl.tpnet.pl [83.6.168.54])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 201923F116;
        Thu, 27 May 2021 18:10:00 +0200 (CEST)
Subject: Re: [PATCH 2/2] video: backlight: qcom-wled: Add PMI8994 compatible
To:     Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, Jingoo Han <jingoohan1@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kiran Gunda <kgunda@codeaurora.org>,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org
References: <20210228124106.135812-1-konrad.dybcio@somainline.org>
 <20210228124106.135812-2-konrad.dybcio@somainline.org>
 <20210322161810.biagj2qro66rv4gt@maple.lan> <20210323083935.GF2916463@dell>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <a81bfa44-ed86-207c-0f8c-c9bbad62733d@somainline.org>
Date:   Thu, 27 May 2021 18:09:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210323083935.GF2916463@dell>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

> Why are you Reviewing/Acking a patch that was applied on the 10th?

Forgive me if it turns out I'm blind, but I can't see the patch being in either -next, backlight/for-next, or 5.13-rc3. Perhaps it was omitted after all?


Konrad

