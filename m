Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57A0FA3A1B
	for <lists+linux-leds@lfdr.de>; Fri, 30 Aug 2019 17:14:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727859AbfH3POA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 30 Aug 2019 11:14:00 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:50633 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727754AbfH3POA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 30 Aug 2019 11:14:00 -0400
Received: by mail-wm1-f68.google.com with SMTP id v15so7752279wml.0;
        Fri, 30 Aug 2019 08:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:subject:to:cc:message-id:in-reply-to:references
         :mime-version;
        bh=E7PGOYI8rGQ02S2EYAIX+ke+QGmp3N+PyvHdu2tcGW0=;
        b=lxMt6aFZ+Lw+pV8L6Tw7ARsCnDOr7PbB+glpwcRzc2q1qIkDzbb5p1tnLGdRvaI1w1
         aOSmZTZXJ1QpsRr+enlJX9lbTKL3sbQN0g5LbNoFRf1FFBBfB9bE7dW0YZnR7Gl9yKUY
         HdfQNqzg02yXGQrZokOpEu7w/TEXTQhScgHNmyzs0x4zPNZXQ4e0fxOewhWtVYvFVrGP
         6/SGvWgB0K0UrUmM/nFta7tFJafJ7N9TbYUO+/XYCt8ytYd6XgmD80Iyog6rapTorQTB
         /bwb2YdlNd2T/ZLhdBjT55rbJkhpv4HKPjy5rxkWaDPgRp8N0u6G9pGm9YkLUjK7jxm/
         LjoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:subject:to:cc:message-id:in-reply-to
         :references:mime-version;
        bh=E7PGOYI8rGQ02S2EYAIX+ke+QGmp3N+PyvHdu2tcGW0=;
        b=j+CHHRfw08TFqA+55/ib1sTpZ1cHtYzr0nJDLB00IFCvrwKRg5LDnKC09xTvoZvayj
         pfuEQGq0Uyaf+LjmpZLRYqcK42eQcYKlbA+qD3V6BjwgTH+zRthHDf8oM7v4LPdsA2tM
         h+Wp0nDiIr6YPmj9fDJr+3Ft6X40P3HZz4zRDt6xjvEgDYeeTA0H0EWUtVbq9q87GXTj
         JtI9vH5c1it4VDvZPTgh/D8yXlyDQhNxnzHg2d3igxPPlnzYT9NyOP+0PHSwNBWKPfQB
         Q0BxpOk96wBBLtpTyphra9d3rDrY+8MMsWmsA0JWzvbVnUFpA3foWrUqWOZ0kinEb2fM
         pw5g==
X-Gm-Message-State: APjAAAVrnQ1VScFXHU02IwqZUEAfWcy/U57rkqs0e2IBEwmEdvUp53M6
        jId+02fIwbLjQokYDM3shIQ=
X-Google-Smtp-Source: APXvYqxJyn0XZ/qM3MACfd810XJfxy3SvRZFOee7lYS28kbnXkUKguPS5L3ollXyo3A/ieoIGlEo7A==
X-Received: by 2002:a1c:9950:: with SMTP id b77mr19687725wme.46.1567178038153;
        Fri, 30 Aug 2019 08:13:58 -0700 (PDT)
Received: from [192.168.1.105] (ip5b4096c3.dynamic.kabel-deutschland.de. [91.64.150.195])
        by smtp.gmail.com with ESMTPSA id q15sm5162920wrv.1.2019.08.30.08.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2019 08:13:57 -0700 (PDT)
Date:   Fri, 30 Aug 2019 17:13:56 +0200
From:   Krzysztof Wilczynski <kswilczynski@gmail.com>
Subject: Re: [PATCH] leds: Move static keyword to the front of declarations
To:     Dan Murphy <dmurphy@ti.com>
Cc:     Krzysztof Wilczynski <kw@linux.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Message-Id: <1567178036.21498.0@gmail.com>
In-Reply-To: <bdf6bc22-bc82-68ac-d3f2-4f3954d9e9e0@ti.com>
References: <20190830090958.27108-1-kw@linux.com>
        <bdf6bc22-bc82-68ac-d3f2-4f3954d9e9e0@ti.com>
X-Mailer: geary/3.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello Dan,

Thank you for feedback.
[...]
> This file is missing in the subject.
> 
> Maybe break it out into a separate patch since they do not have 
> dependencies on each other.

Will do.  Sorry about that.  I initially had these
as separate patches, but after looking at who the
maintainer is and thought that it perhaps makes
sense to send as a single patch.  Good point.

Krzysztof


