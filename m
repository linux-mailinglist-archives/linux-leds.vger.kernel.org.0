Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F330CE5264
	for <lists+linux-leds@lfdr.de>; Fri, 25 Oct 2019 19:33:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502743AbfJYRdX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 25 Oct 2019 13:33:23 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:46964 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391596AbfJYRdX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 25 Oct 2019 13:33:23 -0400
Received: by mail-il1-f195.google.com with SMTP id m16so2497133iln.13
        for <linux-leds@vger.kernel.org>; Fri, 25 Oct 2019 10:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/za/eHCc5YOxno3F960dEsfMKhLfXOAXTv/vlKJMoEE=;
        b=G1oGiG8O60afGke/KjUgd2tG/RdjqxXAI0+PdQzcUIRvQRnmMrIFdCL/v8qDg6c3CY
         Uml6mrI/c3Ct2PddLdPAdrlP8XOvds7Kjczg6z+MN2NjD53UMqlsGqIYqxlunNtwGZi7
         gMBK+/G6/9TkEaxeOFC6MD3hqc8rUsfNvMZ08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/za/eHCc5YOxno3F960dEsfMKhLfXOAXTv/vlKJMoEE=;
        b=sI7e8iKwcET+DfK7hV9qGNJqYzGy7ZTU1NhiDPFFPUbn5NjxSzTqu6dOg1kqSZ96wj
         3CuV5PndH53wMGkIbhPsEaYMlMDuN/psr7jxpXh2BD4D4ITEovhGT0Ys9GwlvdMr3+ZC
         XsBbn4ywMu35uc4331oeJzUmJpigKGMOnYqXoHlxV09YVMlUHIkOlfb6WMnW3bLPIXO2
         gUh6c0OX57IbhetUyqwsVenC00nOwJIhTLxpXqifhSjGuCsQfon60wyBltWDuxFO5QTD
         Oo6Wo7o85KUp2lkS+TNoZZqReFsDKSmKHFwy9joN2G6QvEhndgGN4apj4648aN/inYYg
         nEhg==
X-Gm-Message-State: APjAAAVHDpPLknyAP39KFPB8OZqn0zsYjF6m5xk/A3zT5PlkDWnrVfky
        bOfpa8kYjipZHSZ8H3bwv6GIAA==
X-Google-Smtp-Source: APXvYqwGcZc8kYV3Xx1MurQC6XjEHeqdTcoIEPkiFtkiiNBLe9vEJtobGEUW4cUDtxm5+8pjifmQ8g==
X-Received: by 2002:a92:580d:: with SMTP id m13mr5299155ilb.117.1572024801694;
        Fri, 25 Oct 2019 10:33:21 -0700 (PDT)
Received: from chromium.org ([2620:15c:183:200:5d69:b29f:8fd8:6f45])
        by smtp.gmail.com with ESMTPSA id k3sm34224ilg.27.2019.10.25.10.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2019 10:33:21 -0700 (PDT)
Date:   Fri, 25 Oct 2019 11:33:19 -0600
From:   Daniel Campello <campello@chromium.org>
To:     Nick Crews <ncrews@chromium.org>
Cc:     enric.balletbo@collabora.com, bleung@chromium.org,
        linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com,
        pavel@ucw.cz, linux-kernel@vger.kernel.org, arnd@arndb.de,
        weiyongjun1@huawei.com, dlaurie@chromium.org, djkurtz@chromium.org,
        dtor@google.com, sjg@chromium.org, groeck@chromium.com
Subject: Re: [PATCH v8 1/2] platform/chrome: wilco_ec: Add keyboard backlight
 LED support
Message-ID: <20191025173319.GA1768@chromium.org>
References: <20191024222805.183642-1-ncrews@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191024222805.183642-1-ncrews@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

LGTM.
Reviewed-by: Daniel Campello <campello@chromium.org>
