Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D59E649F3D
	for <lists+linux-leds@lfdr.de>; Mon, 12 Dec 2022 14:00:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232564AbiLLNAD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 12 Dec 2022 08:00:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232496AbiLLM7o (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 12 Dec 2022 07:59:44 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C0291263B
        for <linux-leds@vger.kernel.org>; Mon, 12 Dec 2022 04:59:28 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id ja17so2298844wmb.3
        for <linux-leds@vger.kernel.org>; Mon, 12 Dec 2022 04:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7xyR/mcyrfbwWMfCN8mMVjndqTEj5Gg3aDc/VYz02rA=;
        b=sEIXn7FreHKusmUFLCp92hr10tPgCCrQ9aN+oBMdplS2msnQh3Oc/gCkfJmiUH0rg7
         aVwfcf8ZrDujQQJmPxzKymlwPVncWb73MMRxzrUN5xwGVk0AcKLLH6kfA7Uk+yAWZ2xt
         1Pkz4EYO3lTKrT/bhULCYzhUaeav/m23n6pjkz/V2rS9diJ5Z3eaXj6NyuEDvZ3fQXS8
         P/44KREcTZNfaHi1daXFQvuQtOyI7sPGcme6niGqbH+YJZfJ//cBJqeE+FQihICCRk3u
         AEZ/x+gIkATpQtqeBGYk0ddzBtPtklbAxyanzoam1Ks2mKJfQt5IQibaa6SwKvf2PHok
         tYvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7xyR/mcyrfbwWMfCN8mMVjndqTEj5Gg3aDc/VYz02rA=;
        b=P/L9gImyHzTaxlLI4AdXQc/lDMiwpeUtm73nTOSlas+BJN3MduAk8YjUPgi9Pa6VC8
         NdX2JDZIeWOhnkFn2RivvB3UrhGHfatLTTYVL/kPazpvdummVWpQvXRb2REoeEjWBVrO
         mePid01xanX+0WkSxFSd51YFM9EhE33ZO4QFd8ijQK9C6ub9o3Mklssg0Cn3TUFa7drr
         023vZc3bsYbSe0dAZ4a5pNkIxgjmlkDZWXrIZoHXhOBv3JvFFChsumSD7srxwCaWV/XR
         MNQ6hAWd8X2uPeYKB7Iacei6lpDAB7g+UgC0A/kyYbUp6FHBBUlE4NxoxBqj8qrO0AWt
         x7ow==
X-Gm-Message-State: ANoB5pl6922kU93KToMAAikyl+3jD2miXIm2IvXfXrI6rouypDJFYS/m
        AGKJ70fJdFf2SMAG7TZ3eX249g==
X-Google-Smtp-Source: AA0mqf6OBL/3eVC4N6kdNRRI4Fu9Fm5P9Iq9s/FuZRIzp8zeTxLjdgqMe6xsDO804bbneQLJiAoixw==
X-Received: by 2002:a1c:4c06:0:b0:3cf:88c3:d008 with SMTP id z6-20020a1c4c06000000b003cf88c3d008mr12148059wmf.28.1670849967528;
        Mon, 12 Dec 2022 04:59:27 -0800 (PST)
Received: from Red ([2a01:cb1d:3d5:a100:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id f9-20020a05600c154900b003d2157627a8sm10004768wmg.47.2022.12.12.04.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 04:59:27 -0800 (PST)
Date:   Mon, 12 Dec 2022 13:59:22 +0100
From:   Corentin LABBE <clabbe@baylibre.com>
To:     pavel@ucw.cz, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linus.walleij@linaro.org,
        lee@kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: leds: common: add disk write/read
 and usb-host/usb-gadget
Message-ID: <Y5clqogvKUjk+KN9@Red>
References: <20221028064141.2171405-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221028064141.2171405-1-clabbe@baylibre.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Le Fri, Oct 28, 2022 at 06:41:40AM +0000, Corentin Labbe a écrit :
> The triggers enum misses 3 cases used by gemini DT.
> usb-host was added via commit 0cfbd328d60f ("usb: Add LED triggers for USB activity")
> so we add also as valid trigger usb-gadget which was added along in this
> commit.
> 
> disk-read/disk-write were added by commit d1ed7c558612 ("leds: Extends disk trigger for reads and writes")
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Rob Herring <robh@kernel.org>
> 

Hello Pavel Machek and Lee Jones

The two patch are reviewed, could you take them to your tree ?

thanks
Regards
