Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 964001786B
	for <lists+linux-leds@lfdr.de>; Wed,  8 May 2019 13:36:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726435AbfEHLgU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 8 May 2019 07:36:20 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:36834 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727486AbfEHLgU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 8 May 2019 07:36:20 -0400
Received: by mail-wr1-f65.google.com with SMTP id o4so26766551wra.3
        for <linux-leds@vger.kernel.org>; Wed, 08 May 2019 04:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=VYEsTIrTb6DJazaNiImOw+whc/ESSBeWBeOW5FS1TNw=;
        b=BFtRrccy+NYqC9lMrlxqJyr0TAUtw4PZ/PimeadDxCHkBCmC9gtjj1QR66imPx8Ws/
         01qVIzJKdt38VSrItPx9vuAeXj0l3833LRGAz9Ny54L+jAyeYn+QdMxhD0WJJNmG0tmA
         xxDJusICIc/IfrL1WpaEg0GlEU24zDX+mU538hPNBT1owY15vPadE6rIBx9iKV6hHBgt
         oEltg7DxKDSZmP/Qtuasp1wA3C67a33U7qBnrHs/9DhctVlS+ZQ2SF7oIRLcSq34EtMe
         jg6T6aAgEo5zbeI9l1ceEv+uCDYwI3CEJW0jwM134W4DmhpYm0Z/31o2aXKImMcFOWiX
         5U7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=VYEsTIrTb6DJazaNiImOw+whc/ESSBeWBeOW5FS1TNw=;
        b=pZ1R+wBbNSFbbccLK1Gw+vHw5NQx4OrfDLj8HkuoI6Ga/hZeRgfQg8S7UcXZ8JUX+p
         V1Ufwi6LdGVu6HSEp50iYHdfsqEfK098FdaMADew0XlavRye0m7yVKbKh1vhAtRhJCcS
         jRClQ/b9oOPVXfD36mk9TI6aBbXx1/2bbKoL8x+KyFA8h7wDbEAG3gy+sizaHi7z/qjl
         Pq0EgUP35Gom5xENANIfow+iFDEWagCJ3RtyxZ5TFNRC0hC0CadqnDiM5lk9V9keOEvG
         d9wylEckv1kXhlvwlKUMqpXnACdjFqnzdk2sbb8KCtblkx5UjPVbu2cckaL6FF3yCa7W
         d9ZQ==
X-Gm-Message-State: APjAAAU6lxYEUXlYJ23g1rw87tkoO1cy6PbkfI7eJPbg+RP8yOIti/7P
        1fNKimnKgdooO40ibOsJG4yGEw==
X-Google-Smtp-Source: APXvYqzkVUcylD7EpwjDOvpTADOo5oDkH3ay31bK1cH9dx2YK+OA5OxIhE9LWRHgvVgDMDhkhbCfGg==
X-Received: by 2002:adf:c611:: with SMTP id n17mr3029684wrg.101.1557315379540;
        Wed, 08 May 2019 04:36:19 -0700 (PDT)
Received: from dell ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id c130sm2539799wmf.47.2019.05.08.04.36.18
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 May 2019 04:36:18 -0700 (PDT)
Date:   Wed, 8 May 2019 12:36:17 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz, rdunlap@infradead.org,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 3/7] dt-bindings: mfd: LMU: Add
 ti,brightness-resolution
Message-ID: <20190508113617.GC31645@dell>
References: <20190506191614.25051-1-dmurphy@ti.com>
 <20190506191614.25051-4-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190506191614.25051-4-dmurphy@ti.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, 06 May 2019, Dan Murphy wrote:

> Add ti,brightness-resolution to the TI LMU binding to define
> whether the device uses 8-bit brightness or 11-bit brightness.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
