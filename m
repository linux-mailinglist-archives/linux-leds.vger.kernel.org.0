Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44CB857493C
	for <lists+linux-leds@lfdr.de>; Thu, 14 Jul 2022 11:41:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238127AbiGNJlJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 14 Jul 2022 05:41:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236345AbiGNJlI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 14 Jul 2022 05:41:08 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18AD646DA7
        for <linux-leds@vger.kernel.org>; Thu, 14 Jul 2022 02:41:07 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id z23-20020a7bc7d7000000b003a2e00222acso3302452wmk.0
        for <linux-leds@vger.kernel.org>; Thu, 14 Jul 2022 02:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding;
        bh=7ITMCkMys6kS4GnXThXCrFzJ+x2vhA9RLy8nRC7h2Ps=;
        b=Gw9dcPoI0AL9EIzTPqcn/DgkG46lOCjZSI+d228Po8/eSLZq1aFCIFSRsKmoXtVQYE
         4eYsxmidFPWa0stqbEZ+FDPYK5lQ4CFlOgkjSDGStJemY8WBzQDgb+Lnkqh6e1SS/PYM
         XCR4iM1wN2NZOToZvzsH+VCSdTT8V+yOK431BOA9ZWmArvc7wFoYN1vzr4X1yGX93fHU
         KSkHNk9DkkAzhlYjVQxU5EdiixnM7VTs6YDfQSjrGlmIYpoKIajENRZwKubr7EbELYa3
         MgOeUfFhBHB+kJSS642sqGcWkp/9Pu4iiBJh2SCuNOEKt2tKiBU9WutNQvdZOs3Iuk7A
         UR5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding;
        bh=7ITMCkMys6kS4GnXThXCrFzJ+x2vhA9RLy8nRC7h2Ps=;
        b=k9z0pp0DjFEn+ZXJz4wTl/r+ri5vzouvmffCXNl/qNN7a629wL2WPst87fS0estWsH
         4gwpQ7rAeJhFi+aap/8NsFyWhDkpkfU3jWWyyWJBdgZcf5YbEZb9/XIC/gV3SnYrIpY7
         dtzAVNKtzqDMRONhhyfqSpUkelcKL2D2zxVPgaTErP6bm/zLkNw1idf14dO8JI9opx3D
         zbpkuEx/U1LPel2BhV39lLaeFSCVoKD6/FxYJu5l+EtKvK8P/5/bs6n58D1HANb37ag2
         Y/s0CocT7jmltDeDF1GZe6dpTjGp6JnLUuWBAlkvePq7+z5vhqeyzAE8j4ZNaBPn07mb
         JjzA==
X-Gm-Message-State: AJIora8kwU2HO9DCsLuu9K6+Bu1A4ZVqDnHO2NIQlBTndArpB9cVJswB
        rG0BxamsPbfsu+CWxues0R2fw6c0JpRrpg==
X-Google-Smtp-Source: AGRyM1uvvCgbY/zqupYYF5H/QLQQ666JHCfrYo6l6n0KvQHoHbigrzbYsCrsDByVcOr+YUriQDyvTA==
X-Received: by 2002:a05:600c:3ac6:b0:3a2:ce07:d011 with SMTP id d6-20020a05600c3ac600b003a2ce07d011mr13688557wms.99.1657791665264;
        Thu, 14 Jul 2022 02:41:05 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id u18-20020a05600c19d200b003973c54bd69sm4766784wmq.1.2022.07.14.02.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 02:41:04 -0700 (PDT)
Date:   Thu, 14 Jul 2022 10:41:02 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Subject: LED Maintainership
Message-ID: <Ys/kruf8DE4ISo8M@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel, et al.,

Not sure what's going on behind the scenes, but it looks as though the
LED subsystem has been left unmaintained for at least 2 months now.

Does anyone have any objection to me stepping in as temporary
maintainer until the situation is resolved?

Kind regards,
Lee

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
