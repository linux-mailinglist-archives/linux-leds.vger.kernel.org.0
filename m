Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A090379F184
	for <lists+linux-leds@lfdr.de>; Wed, 13 Sep 2023 20:58:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232090AbjIMS6O (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 13 Sep 2023 14:58:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232086AbjIMS6N (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 13 Sep 2023 14:58:13 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 082D81BC8
        for <linux-leds@vger.kernel.org>; Wed, 13 Sep 2023 11:58:09 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-501b9f27eb2so1583997e87.0
        for <linux-leds@vger.kernel.org>; Wed, 13 Sep 2023 11:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1694631487; x=1695236287; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zBj6p++Qh8jXWGI/WFi0CSgU27ebTJ4j3bK1DZUl5Kw=;
        b=Se/tZ84Q0N0eL+xp/i7O6m19c1QPQO+FBK2xyuRgJUPjoOy541XaQwOkkVRe0StyXo
         AoFOc9Ugy/ESlpabLNH3tXLwnMTJnCUlJNRokWLl47mLLmgTNtqCrdyK0/s3F4BGXE3n
         uqFbWteCM0sRE69O4SZeZ8ayQY89DcIJYnOL8yLojnOj61dXhqISnA4VDdYesfdQ+irq
         dWfkMcj3bbwGT364k46daIC9S8p8Z6IMe7T6SqO4u/mQ+8OAj/x4pIxpM9UisWpzBcHx
         nStXlRO/iELaAiryJsrQEGuobKj7TfsdhiszdIfVZ59Dr+2rOpylQ+qV07ALtsWtnT85
         GWrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694631487; x=1695236287;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zBj6p++Qh8jXWGI/WFi0CSgU27ebTJ4j3bK1DZUl5Kw=;
        b=bUBytT9nFOSMfHf8cftUVaqiiHJrCyJPvPdpDjljE32o5zTgSvLB2KlQW7fLe0J9Ru
         W2+fOz1E4hCvYJxNl63dEieMF/HGYoZ4Ggij3b9ataYR8DyDWEXnz4P0KKwclE8L7SlX
         hlDVorxzU+oEWWyiosI6BpdTxEmMfPx0IMCAD54am1xXp+IIdwCJEYK9IpZABkhKq+Na
         TTf2DlejWDuWCQ1Xaf7izJqzzuJXPFC18Y4iB2/1nfsqqleWyCeW/yZaSnvdRe28Pbw1
         +kxV8wLjs8k0tm4ZltnGDBHVqaPaiP/7vTlESwDXK6FCOB9w5bnTYf6R4A3NQfBr34SF
         WOlw==
X-Gm-Message-State: AOJu0YwSkyhq9yjmF0G4eJ2qtU7fAkBDrth481pTXAZ0W9RAw9SxqQdK
        fFTbp8ixiQ7dT4taxue3QZqYSdmg3rXjXLBN7dsH
X-Google-Smtp-Source: AGHT+IGZ+D5kl00YHI2JJ6DcumX3Ia4Gk29qvxttKtG/Wae63pJv2LYrUq6RpLrHoCOwUoT3JNfEYF4H7ja4ubEBAAU=
X-Received: by 2002:a05:6512:159e:b0:500:af82:7ddc with SMTP id
 bp30-20020a056512159e00b00500af827ddcmr2618766lfb.28.1694631487079; Wed, 13
 Sep 2023 11:58:07 -0700 (PDT)
MIME-Version: 1.0
From:   Da Xue <da@libre.computer>
Date:   Wed, 13 Sep 2023 14:57:55 -0400
Message-ID: <CACqvRUb_X14pjaxA0Q7bQf53TAFmk5rjQOSWqx3Tvi4g+vcNMw@mail.gmail.com>
Subject: linux-stable 6.1.53 kernel crash on COLOR_ID_MULTI handling change
To:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Pavel,

We have running systems that use COLOR_ID_MULTI. The GPIO toggles
between two colors and we have used the identifier. RGB is not a good
fit since it is not a RGB LED. Please provide guidance.

This patch causes the system to not start: f741121a2251 leds: Fix
BUG_ON check for LED_COLOR_ID_MULTI that is always false

It was also backported to stable causing previously booting systems to
no longer boot.

Best,
Da Xue
