Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEC3B577CFE
	for <lists+linux-leds@lfdr.de>; Mon, 18 Jul 2022 10:01:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230033AbiGRIBU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 18 Jul 2022 04:01:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233214AbiGRIBT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 18 Jul 2022 04:01:19 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEBB0FD15
        for <linux-leds@vger.kernel.org>; Mon, 18 Jul 2022 01:01:17 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id v16so15803423wrd.13
        for <linux-leds@vger.kernel.org>; Mon, 18 Jul 2022 01:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=DQJCi6GGtAfAwwXw6aqusUs0n430hwn1M0qOXfspNqY=;
        b=M5OdmIoyOIU1D0O97StWOStYb1EJeDC+RtSxdqtDnAYx24LnFRw6GsKDgGX6sUUbCG
         B3b8Wm0ZBqgk8255QD0faXq55+h1GRNtv5VXyLLDJ8dp2/iyOJ0CrCdC1d8B2ZTfFcI1
         vwQ6LlYitb9US9tTdfCtq+zVgv9k5T8/Ajq2nRpRnNwe0trbSUxVLr2xPnsII4qZ1CEa
         e7I1oY41Ss7EhaerAZSy43WvH106NdvsCSoRnwo07Wi3a8zLjlKQVeII+kNbcn8EUK+q
         QxO9mKTe19iyIZ9wmUk1ua3dCxL36n3OkdErV3QUg91Qwme9hICIjRlEGvT9RY1/mInZ
         vImQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=DQJCi6GGtAfAwwXw6aqusUs0n430hwn1M0qOXfspNqY=;
        b=3b/CLEJ5NmtaIa0g1/A5rJ/NXGzp1/3Te3PqYEG/ibLZxydnP+CQbMsgieufT52hts
         rV3prOSFIBS8nHnuYt/qfy0MPMVgK8jEkA6W0k91UozM9d0sK8TLy4ihySPl1GZX2jWm
         Uv1yKmlmdmry6N0tuZBF/WrZ427ibcFmASOY8hQTVbLVOpp8lXlm3Sffh6qxNIS0ucR5
         YwU4uJR7N1bwP4Ds7WRwFOnX3+V4lwxqrqALI2OArEfdFku4NUfPGnhKiAQYOo5GD/EO
         qMn/ZuR0GPw0dLGgRoI73otcPhcZO3EYJrksW4tMnVLtmEA2MsiykzLCtfCS/yIPen13
         Z2pg==
X-Gm-Message-State: AJIora9qsood9d4V4ZT6N2VxLf9eYQvmJa48XVmqNgGFdgN2aDejpZaN
        6XccXldTX60FdnsF6bVBUUuWNQ==
X-Google-Smtp-Source: AGRyM1uaavJhfPAV54zr6M0dI+YIzgZ0jDjMjCseRBJu0DDLlPWS/c+iqZjKrQVmb2bZyGnqFYxXVw==
X-Received: by 2002:adf:f14d:0:b0:21d:ad67:c2e0 with SMTP id y13-20020adff14d000000b0021dad67c2e0mr21953746wro.247.1658131276363;
        Mon, 18 Jul 2022 01:01:16 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id d13-20020adfe84d000000b0020fcaba73bcsm10029105wrn.104.2022.07.18.01.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 01:01:15 -0700 (PDT)
Date:   Mon, 18 Jul 2022 09:01:13 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 6/8] dt-bindings: backlight: Update Lee Jones' email
 address
Message-ID: <YtUTSY8+idP1UgxZ@google.com>
References: <20220714112533.539910-1-lee@kernel.org>
 <20220714112533.539910-7-lee@kernel.org>
 <20220717102406.GC14285@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220717102406.GC14285@duo.ucw.cz>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, 17 Jul 2022, Pavel Machek wrote:

> Hi!
> 
> > Going forward, I'll be using my kernel.org for upstream work.
> >
> 
> Acked-by: Pavel Machek <pavel@ucw.cz>
> 
> Let me know if you want to take it through the LED tree.

Thanks for the offer.

The plan is to take it via Backlight tree.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
